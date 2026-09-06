#!/bin/bash
set -e

IMAGE="munnangihari/devops-week1-app:latest"
CONTAINER_NAME="devops-week1-app"

echo "Pulling latest image..."
docker pull $IMAGE

echo "Stopping old container (if running)..."
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

echo "Starting new container..."
docker run -d -p 8000:8000 --name $CONTAINER_NAME $IMAGE

echo "Deployment complete."
