from fastapi import APIRouter, File, UploadFile, HTTPException
from fastapi.responses import StreamingResponse
from .schemas import TextToSpeech
from .tts import TTS
from io import BytesIO
import numpy as np
import soundfile as sf


router = APIRouter()
tts = TTS()

@router.get("/tts")
async def get_wav(msg: TextToSpeech):
    return StreamingResponse(
            content=tts.generate_audio(msg.message),
            media_type="audio/wav",
            headers={"Content-Disposition": "attachment; filename=speech.wav"}
        )


@router.get("/stt")
async def get_text(file: UploadFile = File(...)):
    try:
        # Verify audio file type
        if not file.filename.endswith((".wav", ".mp3")):
            raise HTTPException(400, "Unsupported file format")

        # Read audio file
        contents = await file.read()
        audio_buffer = BytesIO(contents)
        
        # Convert audio to numpy array using soundfile
        audio_data, sample_rate = sf.read(audio_buffer)
        
        # Convert stereo to mono if needed
        if len(audio_data.shape) > 1:
            audio_data = np.mean(audio_data, axis=1)

        # Resample if needed (example: to 16000Hz)
        # target_sample_rate = 16000
        # audio_data = librosa.resample(audio_data, orig_sr=sample_rate, target_sr=target_sample_rate)

        # Run STT inference
        # transcription = stt_pipeline(audio_data)["text"]  # Actual model call
        transcription = "Sample transcription"  # Replace with model output

        return {"text": transcription}

    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))