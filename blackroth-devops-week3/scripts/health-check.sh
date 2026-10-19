#!/bin/bash
# Port-forwards to the service and checks / and /health
set -e

NAMESPACE="blackroth-capstone"
LOCAL_PORT="${LOCAL_PORT:-9090}"

kubectl port-forward -n "$NAMESPACE" svc/blackroth-service "$LOCAL_PORT:80" &
PF_PID=$!
sleep 3

echo "Checking /..."
curl -sf "http://localhost:$LOCAL_PORT/" && echo " -> OK" || echo " -> FAILED"

echo "Checking /health..."
curl -sf "http://localhost:$LOCAL_PORT/health" && echo " -> OK" || echo " -> FAILED"

kill $PF_PID
