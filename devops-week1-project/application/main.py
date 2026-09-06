from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"message": "Hello from DevOps Week 1 Project!"}

@app.get("/health")
def health_check():
    return {"status": "healthy"}

