import torch
import soundfile as sf
import io
import whisper
import numpy as np


class TTS:
    
    def __init__(self):
        self.model, _ = torch.hub.load(repo_or_dir='snakers4/silero-models', model='silero_tts', language='ru', speaker='v3_1_ru', jit = True)
        
    def generate_audio(self, message: str):
        audio = self.model.apply_tts(text=message,
                        speaker='eugene',
                        sample_rate=8000)
        sf.write('tts.wav', audio, 8000, format='WAV', subtype='PCM_16')
        print(sf.info('tts.wav'))
    
class STT:
    def __init__(self):
        self.model = whisper.load_model("small") 


    def transcribe(self, buf: io.BytesIO) -> str:
        try:
            # Reset buffer position
            buf.seek(0)
            
            # Load audio data using soundfile
            audio_data, sample_rate = sf.read(buf, dtype="float32")
            
            # Resample to 16kHz if needed (Whisper expects 16kHz)
            if sample_rate != 16000:
                import librosa
                audio_data = librosa.resample(audio_data, orig_sr=sample_rate, target_sr=16000)
            
            # Transcribe using Whisper
            result = self.model.transcribe(audio_data, language="ru")
            return result["text"]
        
        except Exception as e:
            return str(e)