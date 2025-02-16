import api.modules.falldetector.detector
import api.modules.entrancedetector.detector
from contextlib import asynccontextmanager


@asynccontextmanager
async def lifespan(app):
    # Initialize video processor
    # video_processor1 = api.modules.falldetector.detector.VideoProcessor(video_source='rtsp://ipcamera:8554/cam1')  # 0 = default camera
    video_processor2 = api.modules.entrancedetector.detector.VideoProcessor(video_source='rtsp://ipcamera:8554/cam1')  # 0 = default camera
    # video_processor1.start()
    video_processor2.start()

    
    
    yield
    
    # Cleanup
    # video_processor1.stop()
    video_processor2.stop()