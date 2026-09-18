#!/bin/bash
# Deploys the latest image to the kind cluster manually (outside Jenkins)
set -e

NAMESPACE="blackroth-capstone"
IMAGE="${IMAGE:-munnangihari/blackroth-capstone-app:latest}"

echo "Applying namespace, configmap..."
kubectl apply -f kubernetes/namespace.yaml
kubectl apply -f kubernetes/configmap.yaml

echo "NOTE: kubernetes/secret.yaml is gitignored and must be applied manually once:"
echo "  kubectl apply -f kubernetes/secret.yaml"

echo "Deploying image: $IMAGE"
kubectl apply -f kubernetes/deployment.yaml
kubectl apply -f kubernetes/service.yaml
kubectl set image deployment/blackroth-app blackroth-app="$IMAGE" -n "$NAMESPACE"

echo "Waiting for rollout..."
kubectl rollout status deployment/blackroth-app -n "$NAMESPACE"

echo "Deploy complete."
