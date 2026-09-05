#!/bin/bash
set -e

HOST="${1:-localhost}"
PORT="${2:-8000}"
URL="http://${HOST}:${PORT}/health"
MAX_RETRIES=10
RETRY_DELAY=3

echo "Checking health at ${URL}..."

for i in $(seq 1 $MAX_RETRIES); do
  RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "${URL}" || echo "000")
  if [ "$RESPONSE" == "200" ]; then
    echo "Health check passed (attempt ${i})."
    exit 0
  fi
  echo "Attempt ${i}/${MAX_RETRIES}: got HTTP ${RESPONSE}, retrying in ${RETRY_DELAY}s..."
  sleep $RETRY_DELAY
done

echo "Health check failed after ${MAX_RETRIES} attempts."
exit 1
