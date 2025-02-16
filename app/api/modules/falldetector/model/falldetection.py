import cv2
import numpy as np
import mediapipe as mp
import tensorflow as tf
from collections import deque

# Загрузка обученной модели
model = tf.keras.models.load_model("model.h5")

# Инициализация MediaPipe Pose
mp_pose = mp.solutions.pose
pose = mp_pose.Pose(min_detection_confidence=0.5, min_tracking_confidence=0.5)
mp_drawing = mp.solutions.drawing_utils

# Параметры буфера кадров
SEQUENCE_LENGTH = 100  # Количество кадров в последовательности
frame_sequence = deque(maxlen=SEQUENCE_LENGTH)  # Очередь фиксированной длины

# Загружаем mean и std из тренировки
mean = np.load("mean.npy")
std = np.load("std.npy")
std[std == 0] = 1e-8  # Защита от деления на 0

def preprocess_frame(landmarks):
    """Преобразует координаты в нормализованный одномерный вектор."""
    frame_vector = np.array([[lm.x, lm.y] for lm in landmarks]).flatten()
    return (frame_vector - mean) / std  # Применяем ту же нормализацию

url = ''
cap = cv2.VideoCapture(0)  # Открытие камеры

while True:
    ret, frame = cap.read()
    if not ret:
        break

    # Конвертируем кадр в RGB
    frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
    results = pose.process(frame_rgb)
    prediction = 0

    # Проверяем, есть ли обнаруженные ключевые точки
    if results.pose_landmarks:
        processed_frame = preprocess_frame(results.pose_landmarks.landmark)
        frame_sequence.append(processed_frame)

        # Если накоплено достаточно кадров, делаем предсказание
        if len(frame_sequence) == SEQUENCE_LENGTH:
            input_data = np.array(frame_sequence, dtype=np.float32).reshape(1, SEQUENCE_LENGTH, 66)

            # Добавляем паддинг (-100), чтобы учесть Masking
            input_padded = tf.keras.preprocessing.sequence.pad_sequences(
                input_data, padding="post", value=-100
            )

            # Получаем предсказание модели
            prediction = model.predict(input_padded)[0][0]

            # Вывод предупреждения, если обнаружено падение
            if prediction > 0.8:
                cv2.putText(frame, "The man has fallen!", (10, 50),
                            cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)

    # Отображаем видео
    cv2.imshow('Fall Detection', frame)

    # Выход при нажатии 'q'
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# Освобождаем ресурсы
cap.release()
cv2.destroyAllWindows()