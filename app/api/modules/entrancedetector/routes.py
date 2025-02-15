from fastapi.responses import StreamingResponse
from sqlalchemy.orm import Session
from fastapi import Depends, HTTPException, status, APIRouter, Response
from api.database import get_db
from .detector import VideoProcessor, frame_queue
from contextlib import asynccontextmanager
import cv2
import time
import numpy as np
import queue


router = APIRouter()

@asynccontextmanager
async def lifespan(app):
    # Startup logic
    video_processor = VideoProcessor(video_source='rtsp://ipcamera:8554/cam1?tcp&timeout=50000000000')  # 0 = default camera
    video_processor.start()
    yield
    # Shutdown logic
    video_processor.stop()
    video_processor.join()



from fastapi import APIRouter
from fastapi.responses import StreamingResponse

router = APIRouter()

@router.get("/{cam_id}")
async def video_stream(cam_id: int):
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
            yield (b"--frame\r\nContent-Type: image/png\r\n\r\n" 
                   + cv2.imencode(".png")[1].tobytes() 
                   + b"\r\n")