# routes.py
from fastapi import APIRouter
from fastapi.responses import StreamingResponse
from contextlib import asynccontextmanager
import cv2
import queue
import numpy as np

from .detector import VideoProcessor, frame_queue

router = APIRouter()

@router.get("/{cam_id}")
async def video_feed():
    return StreamingResponse(
        generate_frames(),
        media_type="multipart/x-mixed-replace; boundary=frame",
    )

def generate_frames():
    while True:
        try:
            frame = frame_queue.get()
            _, jpeg = cv2.imencode(".jpg", frame)
            yield (b"--frame\r\nContent-Type: image/jpeg\r\n\r\n" 
                   + jpeg.tobytes() + b"\r\n")
        except queue.Empty:
            # Send blank frame if queue is empty
            blank_frame = np.zeros((480, 640, 3), dtype=np.uint8)
            _, jpeg = cv2.imencode(".jpg", blank_frame)
            yield (b"--frame\r\nContent-Type: image/jpeg\r\n\r\n" 
                   + jpeg.tobytes() + b"\r\n")