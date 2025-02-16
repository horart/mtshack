import os
import json
import numpy as np
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Input, Masking, TimeDistributed, Dense, Bidirectional, GRU, SpatialDropout1D, BatchNormalization, Dropout
from tensorflow.keras.callbacks import ReduceLROnPlateau, EarlyStopping
from tensorflow.keras.optimizers import Adam
from sklearn.model_selection import train_test_split
from sklearn.metrics import recall_score, f1_score, roc_auc_score

##############################################################################
# 1. Функции для загрузки и преобразования кадров
##############################################################################
def frame_to_vector(frame_dict):
    """Преобразование словаря keypoints одного кадра в вектор (x1, y1, x2, y2, ...)."""
    keys = sorted(frame_dict.keys())
    vector = []
    for key in keys:
        vector.extend([frame_dict[key]['x'], frame_dict[key]['y']])
    return vector

def sequence_to_vectors(data):
    """Преобразование JSON одного видео в список векторов (по одному на кадр)."""
    frames = sorted(data.keys(), key=lambda x: int(x.split('_')[1]))
    return [frame_to_vector(data[frame]) for frame in frames]

def load_sequences_from_folder(folder_path, label):
    """Загрузка всех JSON-файлов из папки."""
    sequences, labels = [], []
    for filename in os.listdir(folder_path):
        if filename.endswith('.json'):
            filepath = os.path.join(folder_path, filename)
            with open(filepath, 'r', encoding='utf-8') as f:
                data = json.load(f)
                seq = sequence_to_vectors(data)
                if len(seq) > 10:  # Исключаем слишком короткие видео
                    sequences.append(seq)
                    labels.append(label)
    return sequences, labels

##############################################################################
# 2. Загрузка данных
##############################################################################
fall_sequences, fall_labels = load_sequences_from_folder('fall_json', label=1)
good_sequences, good_labels = load_sequences_from_folder('good_json', label=0)

X = fall_sequences + good_sequences
y = np.array(fall_labels + good_labels)

##############################################################################
# 3. Нормализация координат (x, y)
##############################################################################
all_coords = np.array([frame for seq in X for frame in seq])
mean = np.mean(all_coords, axis=0)
std = np.std(all_coords, axis=0)
std[std == 0] = 1e-8  # Защита от деления на 0
np.save("mean.npy", mean)
np.save("std.npy", std)

def normalize_sequence(seq):
    return (np.array(seq) - mean) / std

X_norm = [normalize_sequence(seq) for seq in X]

##############################################################################
# 4. Разделение на train/test
##############################################################################
X_train_list, X_test_list, y_train, y_test = train_test_split(
    X_norm, y, test_size=0.2, random_state=42, stratify=y
)

# Преобразование списков последовательностей в RaggedTensors
X_train_rt = tf.ragged.constant(X_train_list, dtype=tf.float32)
X_test_rt  = tf.ragged.constant(X_test_list,  dtype=tf.float32)

# Приведение RaggedTensor к плотному виду с паддингом (-100)
X_train_padded = X_train_rt.to_tensor(default_value=-100)
X_test_padded  = X_test_rt.to_tensor(default_value=-100)

##############################################################################
# 5. Подготовка sample_weight (маска для игнорирования паддинга)
##############################################################################
train_mask = tf.cast(X_train_padded != -100, dtype=tf.float32)
test_mask  = tf.cast(X_test_padded  != -100, dtype=tf.float32)

##############################################################################
# 6. Архитектура модели
##############################################################################
model = Sequential([
    Input(shape=(None, 66), dtype=tf.float32),  # 33 точки * 2 координаты

    # Masking для игнорирования паддинга
    Masking(mask_value=-100.0),
    
    SpatialDropout1D(0.3),
    Bidirectional(GRU(64, return_sequences=True)),
    BatchNormalization(),
    Dropout(0.4),

    Bidirectional(GRU(32, return_sequences=True)),
    BatchNormalization(),
    Dropout(0.4),

    Bidirectional(GRU(16)),
    BatchNormalization(),
    Dropout(0.4),

    Dense(32, activation='relu'),
    Dropout(0.4),
    Dense(1, activation='sigmoid')
])

# Используем Adam вместо RMSprop
optimizer = Adam(learning_rate=1e-3)

model.compile(
    optimizer=optimizer,
    loss='binary_crossentropy',
    metrics=['accuracy']
)

model.summary()

##############################################################################
# 7. Callbacks
##############################################################################
reduce_lr = ReduceLROnPlateau(monitor='val_loss', factor=0.5, patience=3, min_lr=1e-6)
early_stopping = EarlyStopping(monitor='val_loss', patience=5, restore_best_weights=True)

##############################################################################
# 8. Обучение модели с sample_weight
##############################################################################
history = model.fit(
    X_train_padded, y_train,
    sample_weight=tf.reduce_mean(train_mask, axis=(1, 2)),  # Усредняем маску по кадрам
    epochs=30,
    batch_size=32,
    validation_data=(X_test_padded, y_test, tf.reduce_mean(test_mask, axis=(1, 2))),
    callbacks=[reduce_lr, early_stopping]
)

##############################################################################
# 9. Оценка модели
##############################################################################
y_pred_probs = model.predict(X_test_padded)
y_pred = (y_pred_probs >= 0.5).astype(int)  # Преобразуем вероятности в 0/1

# Вычисляем метрики
recall = recall_score(y_test, y_pred)
f1 = f1_score(y_test, y_pred)
roc_auc = roc_auc_score(y_test, y_pred_probs)  # Для ROC AUC используем вероятности

print(f"Recall: {recall:.4f}")
print(f"F1-score: {f1:.4f}")
print(f"ROC AUC: {roc_auc:.4f}")

##############################################################################
# 10. Сохранение модели
##############################################################################
model.save("model1.h5")