from typing import Optional
from pydantic import BaseModel, Field, ConfigDict, SkipValidation
import datetime

# House Schemas

class BillingBase(BaseModel):
    user_id: int
    sum: float
    month: datetime.datetime

    class Config:
        orm_mode = True

class BillingCreate(BillingBase):
    sum: float = Field(ge=0.0)
    month: Optional[datetime.datetime] = None
    

class BillingResponse(BillingBase):
    id: int
