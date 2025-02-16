from fastapi import APIRouter, File, UploadFile, HTTPException
from fastapi.responses import FileResponse
from .schemas import TextToSpeech, SpeechToTextResponse
from .tts import TTS, STT
import io


router = APIRouter()
tts = TTS()
stt = STT()

@router.get("/tts")
async def get_wav(msg: TextToSpeech):
    tts.generate_audio(msg.message)
    return FileResponse(
            media_type="audio/wav",
            filename="audio.wav",
            path="tts.wav"
        )


@router.post("/stt")
async def get_text(file: UploadFile = File(...)) -> SpeechToTextResponse:
    try:
        buf = io.BytesIO(await file.read())
        buf.seek(0)
        return {"text": stt.transcribe(buf)}

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))