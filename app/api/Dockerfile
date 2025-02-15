FROM python:3.12



EXPOSE 8000

COPY requirements.txt /usr/src/app/requirements.txt

WORKDIR /usr/src

RUN pip install -r /usr/src/app/requirements.txt

CMD ["python", "-m",  "uvicorn", "api.main:app",  "--reload", "--host", "0.0.0.0", "--port", "8000"]

# CMD ["sleep", "infinity"]