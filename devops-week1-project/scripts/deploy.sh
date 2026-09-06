#!/bin/bash
set -e

IMAGE="${IMAGE:-munnangihari/devops-week1-app:latest}"
CONTAINER_NAME="${CONTAINER_NAME:-devops-week1-app}"
PORT="${PORT:-8000}"

echo "Deploying image: $IMAGE"
echo "Pulling latest image..."
docker pull "$IMAGE"

echo "Stopping old container (if running)..."
docker stop "$CONTAINER_NAME" || true
docker rm "$CONTAINER_NAME" || true

echo "Starting new container..."
docker run -d -p "$PORT:$PORT" --name "$CONTAINER_NAME" \
  --log-driver=awslogs \
  --log-opt awslogs-region=eu-north-1 \
  --log-opt awslogs-group=/devops-week1/app \
  --log-opt awslogs-create-group=true \
  --log-opt awslogs-stream="$CONTAINER_NAME" \
  "$IMAGE"

echo "Deployment complete."
