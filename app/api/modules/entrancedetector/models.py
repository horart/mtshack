from api.database import Base
from sqlalchemy import Column, Float, Integer, ForeignKey, Date
from sqlalchemy.types import ARRAY
import datetime


class Camera(Base):
    __tablename__ = 'bills'
    id = Column(Integer , primary_key=True, autoincrement=True)
    house_id = Column(Integer, ForeignKey("houses.id"), nullable=False)
    sum = Column(Float, nullable=False)
    month = Column(Date, default=lambda: datetime.datetime.today().replace(day=1), nullable=False)