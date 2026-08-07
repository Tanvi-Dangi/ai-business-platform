FROM python:3.12-slim
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends git && rm -rf /var/lib/apt/lists/*
COPY . /app
RUN python -c "import os; os.makedirs('agents', exist_ok=True); os.makedirs('tools', exist_ok=True); os.makedirs('output', exist_ok=True); os.makedirs('logs', exist_ok=True)"
CMD ["python", "main.py"]
