from api.database import Base
from sqlalchemy import Column, String, Integer, ForeignKey
from sqlalchemy.types import ARRAY



class House(Base):
    __tablename__ = 'houses'
    id = Column(Integer , primary_key=True, autoincrement=True)
    address = Column(String, nullable=False)
    district = Column(Integer, nullable=False)
    flat_count = Column(Integer,
                       nullable=False)



class User(Base):
    __tablename__ = 'users'
    id = Column(Integer , primary_key=True, autoincrement=True)
    name = Column(String, nullable=False)
    age = Column(Integer, nullable=False)
    house_id = Column(Integer, ForeignKey(House.id), nullable=False, default=True)
    flat_number = Column(Integer,
                       nullable=False)
    hia = Column(ARRAY(Integer))