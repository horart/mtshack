from .schemas import BillingCreate, BillingResponse, BillingBase
from .models import Billing
from api.modules.base.models import User
from sqlalchemy.orm import Session
from fastapi import Depends, HTTPException, status, APIRouter, Response
from api.database import get_db
from .predict import Predictor

router = APIRouter()


# Create a new bill
@router.post("/", response_model=BillingResponse)
def create_bill(bill: BillingCreate, db: Session = Depends(get_db)):
    db_user = db.query(User).filter(User.id == bill.user_id).first()
    if not db_user:
        raise HTTPException(status_code=404, detail="User not found")
    print(bill.model_dump())
    db_bill = Billing(**bill.model_dump())
    db.add(db_bill)
    db.commit()
    db.refresh(db_bill)
    return db_bill

# Get all bills
@router.get("/", response_model=list[BillingResponse])
def get_bills(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    return db.query(Billing).offset(skip).limit(limit).all()

# Get a specific bill by ID
@router.get("/{bill_id}", response_model=BillingResponse)
def get_bill(bill_id: int, db: Session = Depends(get_db)):
    bill = db.query(Billing).filter(Billing.id == bill_id).first()
    if not bill:
        raise HTTPException(status_code=404, detail="Bill not found")
    return bill

# Update a bill
@router.put("/{bill_id}", response_model=BillingResponse)
def update_bill(bill_id: int, bill: BillingCreate, db: Session = Depends(get_db)):
    db_bill = db.query(Billing).filter(Billing.id == bill_id).first()
    if not db_bill:
        raise HTTPException(status_code=404, detail="Bill not found")
    
    for key, value in bill.model_dump().items():
        setattr(db_bill, key, value)
    
    db.commit()
    db.refresh(db_bill)
    return db_bill

# Delete a bill
@router.delete("/{bill_id}")
def delete_bill(bill_id: int, db: Session = Depends(get_db)):
    bill = db.query(Billing).filter(Billing.id == bill_id).first()
    if not bill:
        raise HTTPException(status_code=404, detail="Bill not found")
    
    db.delete(bill)
    db.commit()
    return {"message": "Bill deleted successfully"}

@router.get("/prediction/{user_id}")
def get_pred(user_id: int, db: Session = Depends(get_db)):
    db_user = db.query(User).filter(User.id == user_id).first()
    if not db_user:
        raise HTTPException(status_code=404, detail="User not found")
    last_twelve_months = (
        db.query(Billing)
        .filter(Billing.user_id == user_id)
        .order_by(Billing.month.desc())
        .limit(12)
        .all()
    )
    return {"last_twelve_months": [BillingResponse.model_validate(i.__dict__) for i in last_twelve_months], "prediction": Predictor.predict(last_twelve_months)}