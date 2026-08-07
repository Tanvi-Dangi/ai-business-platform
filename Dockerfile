FROM python:3.11-slim

WORKDIR /app

# Install dependencies directly and explicitly
RUN pip install --no-cache-dir fastapi uvicorn pydantic

COPY . .

EXPOSE 10000

CMD ["python", "-m", "uvicorn", "app:app", "--host", "0.0.0.0", "--port", "10000"]