FROM python:3.11-slim

WORKDIR /app

RUN pip install --no-cache-dir fastapi uvicorn pydantic

COPY . .

EXPOSE 10000

CMD ["sh", "-c", "python -m uvicorn main:app --host 0.0.0.0 --port ${PORT:-10000}"]