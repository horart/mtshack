import api.modules.base.routes
import api.modules.billpredict.routes
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from api.database import engine, Base
import api.modules.entrancedetector.routes
import api.modules.falldetector
import api.modules.falldetector.routes
import api.modules.text2speech
import api.modules.text2speech.routes
from . import lifespan
import os
os.environ["TF_USE_LEGACY_KERAS"] = "0"


app = FastAPI(lifespan=lifespan.lifespan)

origins = [
    "http://localhost:3000",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
Base.metadata.create_all(bind=engine)


app.include_router(api.modules.base.routes.router, tags=['Base'])
app.include_router(api.modules.billpredict.routes.router, tags=['Billing'], prefix="/bill")
app.include_router(api.modules.entrancedetector.routes.router, tags=['EntranceDetection'], prefix="/entrancecam")
app.include_router(api.modules.text2speech.routes.router, tags=['TtsStt'])
app.include_router(api.modules.falldetector.routes.router, tags=['FallDetector'], prefix='/fallcam')