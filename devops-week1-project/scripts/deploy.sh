#!/bin/bash
set -e

IMAGE_NAME="munnangihari/devops-week1-app"
TAG="${BUILD_NUMBER:-latest}"
CONTAINER_NAME="devops-week1-app"
HOST_PORT=8000
CONTAINER_PORT=8000

echo "Pulling image ${IMAGE_NAME}:${TAG}..."
docker pull ${IMAGE_NAME}:${TAG}

echo "Stopping and removing old container if it exists..."
docker stop ${CONTAINER_NAME} 2>/dev/null || true
docker rm ${CONTAINER_NAME} 2>/dev/null || true

echo "Starting new container..."
docker run -d \
  --name ${CONTAINER_NAME} \
  --restart unless-stopped \
  -p ${HOST_PORT}:${CONTAINER_PORT} \
  ${IMAGE_NAME}:${TAG}

echo "Deployment complete. Container running on port ${HOST_PORT}."
