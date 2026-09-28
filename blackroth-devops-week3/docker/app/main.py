from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def root():
    return {"message": "Hello from Blackroth DevOps Week 3 Capstone!"}


@app.get("/health")
def health():
    return {"status": "healthy"}
