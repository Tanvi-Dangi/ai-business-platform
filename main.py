from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import os

# Initialize FastAPI application with the exact name 'app' expected by Uvicorn
app = FastAPI(
    title="AI Business Platform API",
    description="Autonomous Business Platform backend service",
    version="1.0.0"
)

class QueryRequest(BaseModel):
    prompt: str

@app.get("/")
def read_root():
    return {
        "status": "online",
        "message": "AI Business Platform API is running successfully!"
    }

@app.get("/health")
def health_check():
    return {"status": "healthy"}

@app.post("/run-agent")
def run_agent(payload: QueryRequest):
    try:
        # Core execution hook for your autonomous agents and tools
        query = payload.prompt
        if not query:
            raise HTTPException(status_code=400, detail="Prompt cannot be empty.")
            
        return {
            "status": "success",
            "received_prompt": query,
            "result": f"Processed successfully by AI Business Platform."
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))