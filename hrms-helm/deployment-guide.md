# HRMS Helm Deployment Guide

## Prerequisites
- Kubernetes cluster (Amazon EKS)
- Namespace: `devops-training`
- AWS Load Balancer Controller installed
- HRMS Docker image pushed to ECR

## Deployment Steps

1. Create namespace (if not exists):
   ```bash
   kubectl create namespace devops-training

