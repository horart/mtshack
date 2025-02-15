from . import models
from . import schemas
from sqlalchemy.orm import Session
from fastapi import Depends, HTTPException, status, APIRouter, Response
from api.database import get_db

router = APIRouter()


@router.post("/house/", response_model=schemas.HouseResponse)
def create_house(house: schemas.HouseCreate, db: Session = Depends(get_db)):
    db_house = models.House(**house.model_dump())
    db.add(db_house)
    db.commit()
    db.refresh(db_house)
    return db_house

@router.get("/house/", response_model=list[schemas.HouseResponse])
def read_houses(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    return db.query(models.House).offset(skip).limit(limit).all()

@router.get("/house/{house_id}", response_model=schemas.HouseResponse)
def read_house(house_id: int, db: Session = Depends(get_db)):
    house = db.query(models.House).filter(models.House.id == house_id).first()
    if not house:
        raise HTTPException(status_code=404, detail="House not found")
    return house

@router.put("/house/{house_id}", response_model=schemas.HouseResponse)
def update_house(house_id: int, house: schemas.HouseCreate, db: Session = Depends(get_db)):
    db_house = db.query(models.House).filter(models.House.id == house_id).first()
    if not db_house:
        raise HTTPException(status_code=404, detail="House not found")
    
    for key, value in house.model_dump().items():
        setattr(db_house, key, value)
    
    db.commit()
    db.refresh(db_house)
    return db_house

@router.delete("/house/{house_id}")
def delete_house(house_id: int, db: Session = Depends(get_db)):
    house = db.query(models.House).filter(models.House.id == house_id).first()
    if not house:
        raise HTTPException(status_code=404, detail="House not found")
    
    db.delete(house)
    db.commit()
    return {"message": "House deleted successfully"}


@router.post("/user/", response_model=schemas.UserResponse)
def create_user(user: schemas.UserCreate, db: Session = Depends(get_db)):
    # Check if house exists first
    house = db.query(models.House).filter(models.House.id == user.house_id).first()
    if not house:
        raise HTTPException(status_code=404, detail="House not found")
    
    db_user = models.User(**user.model_dump())
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user

@router.get("/user/", response_model=list[schemas.UserResponse])
def read_users(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    return db.query(models.User).offset(skip).limit(limit).all()

@router.get("/user/{user_id}", response_model=schemas.UserResponse)
def read_user(user_id: int, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.id == user_id).first()
    print(user_id, user)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    return user

@router.put("/user/{user_id}", response_model=schemas.UserResponse)
def update_user(user_id: int, user: schemas.UserCreate, db: Session = Depends(get_db)):
    db_user = db.query(models.User).filter(models.User.id == user_id).first()
    if not db_user:
        raise HTTPException(status_code=404, detail="User not found")
    
    # Check house exists if updating house_id
    if user.house_id != db_user.house_id:
        house = db.query(models.House).filter(models.House.id == user.house_id).first()
        if not house:
            raise HTTPException(status_code=404, detail="House not found")
    
    for key, value in user.model_dump().items():
        setattr(db_user, key, value)
    
    db.commit()
    db.refresh(db_user)
    return db_user

@router.delete("/user/{user_id}")
def delete_user(user_id: int, db: Session = Depends(get_db)):
    user = db.query(models.User).filter(models.User.id == user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    
    db.delete(user)
    db.commit()
    return {"message": "User deleted successfully"}

