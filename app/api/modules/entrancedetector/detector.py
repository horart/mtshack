# import threading
# import queue
# import time
# import cv2
# from deepface import DeepFace
# import warnings
# import logging

# # Отключаем предупреждения и логи
# warnings.filterwarnings("ignore")
# logging.disable(logging.CRITICAL)


# frame_queue = queue.Queue(maxsize=10)

# class VideoProcessor(threading.Thread):
#     def __init__(self, video_source='rtsp://ipcamera:8554/cam1?tcp&timeout=50000000000'):
#         super().__init__()
#         self.video_source = video_source
#         self.running = True
#         print(1)

#     def run(self):
#         cap = cv2.VideoCapture(self.video_source)
#         while self.running:
#             ret, frame = cap.read()
#             if not ret:
#                 break
#             print(2)
            
#             # Process frame (add bounding boxes)
#             processed_frame = self.process_frame(frame)
            
#             # Add to queue for streaming
#             if not frame_queue.full():
#                 frame_queue.put(processed_frame)
#             else:
#                 # Drop frames if queue is full
#                 time.sleep(0.01)

#         cap.release()

#     def process_frame(self, frame):
#         # Replace with your model inference logic
#         # Example: Add a bounding box
#         try:
#             da = DeepFace.analyze(frame, actions=['age', 'gender', 'race'], enforce_detection=True)
#             age = da[0]['age']
#             gender = da[0]['gender']
#             gender = max(gender, key=gender.get)  # Выбираем максимальную вероятность пола
#             race = da[0]['dominant_race']
#             cv2.putText(frame, f"Возраст: {age-5}-{age}", (10, 30),
#             cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
#             cv2.putText(frame, f"Пол: {gender}", (10, 60),
#                         cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
#             cv2.putText(frame, f"Раса: {race}", (10, 90),
#                         cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
#             return frame
        
#         except Exception:
#             return frame

#     def stop(self):
#         self.running = False




# # import cv2
# # from deepface import DeepFace
# # from time import sleep
# # import warnings
# # import logging
# # import json

# # # Отключаем предупреждения и логи
# # warnings.filterwarnings("ignore")
# # logging.disable(logging.CRITICAL)

# # # Инициализация камеры
# # cap = cv2.VideoCapture(0)  # 0 - стандартная камера

# # # Цикл, который ждёт появления лица и задерживает анализ на 1 секунду
# # while True:
# #     try:
# #         DeepFace.analyze(cap.read()[1], actions=['age', 'gender', 'race'], enforce_detection=True)
# #         break
# #     except Exception:
# #         pass
# #     if cv2.waitKey(1) & 0xFF == ord('q'):
# #         break   

# # sleep(3)
# # anal = DeepFace.analyze(cap.read()[1], actions=['age', 'gender', 'race'], enforce_detection=False)
# # age = anal[0]['age']
# # gender = anal[0]['gender']
# # gender = max(gender, key=gender.get)  # Выбираем максимальную вероятность пола
# # race = anal[0]['dominant_race']

# # # Создаем словарь для сохранения данных
# # person_data = {
# #     "age": age,
# #     "gender": gender,
# #     "race": race
# # }

# # # Сохраняем данные в JSON файл
# # with open('person_data.json', 'w') as json_file:
# #     json.dump(person_data, json_file, indent=4)

# # # Отображение информации после анализа
# # while True:
# #     frame = cap.read()[1]
# #     cv2.putText(frame, f"Age: {age-5}-{age}", (10, 30),
# #                 cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
# #     cv2.putText(frame, f"Gender: {gender}", (10, 60),
# #                 cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
# #     cv2.putText(frame, f"Race: {race}", (10, 90),
# #                 cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
# #     cv2.imshow('Video Stream', frame)
# #     if cv2.waitKey(1) & 0xFF == ord('q'):
# #         break

# # cap.release()
# # cv2.destroyAllWindows()



import threading
import queue
import time
import cv2
from deepface import DeepFace
import numpy as np

frame_queue = queue.Queue(maxsize=2)  # Store only the latest frame

class FreshestFrame(threading.Thread):
    def __init__(self, capture):
        super().__init__(daemon=True)
        self.capture = capture
        self.cond = threading.Condition()
        self.running = True
        self.frame = None
        self.latestnum = 0

    def run(self):
        counter = 0
        while self.running:
            rv, img = self.capture.read()
            if not rv:
                continue
            counter += 1
            with self.cond:
                self.frame = img
                self.latestnum = counter
                self.cond.notify_all()

    def read(self):
        with self.cond:
            return self.frame.copy() if self.frame is not None else None

    def stop(self):
        self.running = False
        self.join()

class VideoProcessor(threading.Thread):
    def __init__(self, video_source='rtsp://ipcamera:8554/cam1?tcp&timeout=50000000000'):
        super().__init__(daemon=True)
        self.cap = cv2.VideoCapture(video_source)
        self.fresh = FreshestFrame(self.cap)
        self.running = True
        self.last_analysis = {"age": 0, "gender": "unknown", "race": "unknown"}
        self.analysis_interval = 1  # Seconds between analysis
        self.last_analysis_time = 0
        self.last_recognition = 0

    def run(self):
        self.fresh.start()
        while self.running:
            frame = self.fresh.read()
            if frame is None:
                # time.sleep(0.1)
                continue
            processed_frame = self.process_frame(frame)
            try:
                # Only keep the latest frame
                frame_queue.get_nowait()
            except queue.Empty:
                pass
            frame_queue.put(processed_frame)

    def process_frame(self, frame):
        current_time = time.time()
        if current_time - self.last_analysis_time > self.analysis_interval:
            try:
                analysis = DeepFace.analyze(
                    frame, 
                    actions=['age', 'gender', 'race'],
                    enforce_detection=True
                )[0]
                self.last_analysis.update({
                    "age": analysis['age'],
                    "gender": max(analysis['gender'].items(), key=lambda x: x[1])[0],
                    "race": analysis['dominant_race'],
                })
                self.last_recognition = time.time()
                self.last_analysis_time = current_time
            except Exception as e:
                pass
        
        return self.add_overlay(frame) if time.time() - self.last_recognition <= 5 else frame

    def add_overlay(self, frame):
        cv2.putText(frame, f"Age: {self.last_analysis['age']}", (10, 30),
                   cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)
        cv2.putText(frame, f"Gender: {self.last_analysis['gender']}", (10, 60),
                   cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)
        cv2.putText(frame, f"Race: {self.last_analysis['race']}", (10, 90),
                   cv2.FONT_HERSHEY_SIMPLEX, 0.7, (0, 255, 0), 2)
        return frame

    def stop(self):
        self.running = False
        self.fresh.stop()
        self.cap.release()
        self.join()

# FastAPI Routes
