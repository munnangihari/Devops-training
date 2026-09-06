#!/bin/bash

URL="http://localhost:8000/health"
MAX_RETRIES=5
RETRY_DELAY=3

for i in $(seq 1 $MAX_RETRIES); do
    RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" $URL)
    if [ "$RESPONSE" == "200" ]; then
        echo "Health check passed (attempt $i)."
        curl -s $URL
        exit 0
    fi
    echo "Health check attempt $i failed (HTTP $RESPONSE), retrying in ${RETRY_DELAY}s..."
    sleep $RETRY_DELAY
done

echo "Health check failed after $MAX_RETRIES attempts."
exit 1
