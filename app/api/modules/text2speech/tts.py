import torch
import soundfile as sf
import io


class TTS:
    
    def __init__(self):
        self.model, _ = torch.hub.load(repo_or_dir='snakers4/silero-models', model='silero_tts', language='ru', speaker='v3_1_ru', jit = True)
        
    def generate_audio(self, message: str):
        audio = self.model.apply_tts(text="Постмодерн это эпоха, где границы между высокой и массовой культурой стираются, а реальность превращается в бесконечную игру смыслов. В постмодерне автор перестаёт быть абсолютным создателем текста, а интерпретация становится важнее самого произведения.",
                        speaker='eugene',
                        sample_rate=8000)
        
        buf = io.BytesIO()
        sf.write(buf, audio, 8000, format='WAV', subtype='PCM_16')
        buf.seek(0)
        
        return buf