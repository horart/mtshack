# detector.py
import threading
import queue
import cv2
import numpy as np
import mediapipe as mp
import tensorflow as tf
from collections import deque


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
        
        # Initialize fall detection components
        self.mp_pose = mp.solutions.pose
        self.pose = self.mp_pose.Pose(
            min_detection_confidence=0.5, 
            min_tracking_confidence=0.5
        )
        
        # Load model and normalization parameters
        self.model = tf.keras.models.load_model("api/modules/falldetector/model/model.h5")
        self.mean = np.load("api/modules/falldetector/model/mean.npy")
        self.std = np.load("api/modules/falldetector/model/std.npy")
        self.std[self.std == 0] = 1e-8
        
        # Frame sequence buffer
        self.SEQUENCE_LENGTH = 100
        self.frame_sequence = deque(maxlen=self.SEQUENCE_LENGTH)
        self.current_prediction = 0.0
        self.fall_detected = False

    def run(self):
        self.fresh.start()
        while self.running:
            frame = self.fresh.read()
            if frame is None:
                continue
                
            processed_frame = self.process_frame(frame)
            
            try:
                frame_queue.get_nowait()
            except queue.Empty:
                pass
            frame_queue.put(processed_frame)

    def preprocess_frame(self, landmarks):
        """Process landmarks and normalize"""
        frame_vector = np.array([[lm.x, lm.y] for lm in landmarks]).flatten()
        return (frame_vector - self.mean) / self.std

    def process_frame(self, frame):
        # Convert to RGB for MediaPipe
        frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        results = self.pose.process(frame_rgb)
        
        if results.pose_landmarks:
            processed_frame = self.preprocess_frame(results.pose_landmarks.landmark)
            self.frame_sequence.append(processed_frame)
            
            if len(self.frame_sequence) == self.SEQUENCE_LENGTH:
                input_data = np.array(self.frame_sequence, dtype=np.float32).reshape(
                    1, self.SEQUENCE_LENGTH, 66
                )
                
                input_padded = tf.keras.preprocessing.sequence.pad_sequences(
                    input_data, padding="post", value=-100
                )
                
                self.current_prediction = self.model.predict(input_padded)[0][0]
                self.fall_detected = self.current_prediction > 0.8
                
        # Draw pose landmarks and fall status
        self.mp_drawing = mp.solutions.drawing_utils
        self.mp_drawing.draw_landmarks(
            frame, results.pose_landmarks, self.mp_pose.POSE_CONNECTIONS
        )
        
        if self.fall_detected:
            cv2.putText(frame, "FALL DETECTED!", (10, 50),
                        cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)
            
        cv2.putText(frame, f"Fall probability: {self.current_prediction:.2f}", 
                    (10, frame.shape[0] - 20), cv2.FONT_HERSHEY_SIMPLEX, 
                    0.7, (0, 255, 0), 2)
        
        return frame

    def stop(self):
        self.running = False
        self.fresh.stop()
        self.cap.release()
        self.join()