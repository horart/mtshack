from pydantic import BaseModel, Field

# House Schemas

class TextToSpeech(BaseModel):
    message: str = Field(min_length=1)

class SpeechToTextResponse(BaseModel):
    text: str