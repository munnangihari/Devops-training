# Use lightweight Python base image
FROM python:3.11-alpine

# Set working directory
WORKDIR /app

# Install build dependencies (needed for some Python packages)
RUN apk add --no-cache gcc musl-dev libffi-dev

# Copy requirements first for caching
COPY application/requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY application/ ./application
COPY tests/ ./tests

# Expose FastAPI port
EXPOSE 8000

# Run FastAPI app from main.py
CMD ["uvicorn", "application.main:app", "--host", "0.0.0.0", "--port", "8000"]

