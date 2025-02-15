from typing import List, Optional
from pydantic import BaseModel, Field

# House Schemas
class HouseBase(BaseModel):
    address: str
    district: int
    flat_count: int

class HouseCreate(HouseBase):
    address: str = Field(..., min_length=1)

class HouseResponse(HouseBase):
    id: int
    
    class Config:
        orm_mode = True

# User Schemas
class UserBase(BaseModel):
    name: str
    age: int
    house_id: int
    flat_number: int
    hia: List[int] = []

class UserCreate(UserBase):
    name: str = Field(..., min_length=1)

class UserResponse(UserBase):
    id: int
    
    class Config:
        orm_mode = True

