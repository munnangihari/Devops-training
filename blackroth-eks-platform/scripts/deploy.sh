#!/bin/bash
set -e
terraform -chdir=terraform/environments/dev apply -auto-approve
helm upgrade --install hrms ./helm/hrms -n hrms --create-namespace
kubectl rollout status deployment/hrms -n hrms
