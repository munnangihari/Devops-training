# Deployment Guide

## Prerequisites
- Terraform >= 1.16
- Docker
- kubectl
- kind
- AWS CLI configured (account 091199627403, region us-east-1)

## 1. Provision AWS infrastructure
```bash
cd terraform/environments/dev
export TF_VAR_db_password="<your-password>"
terraform init
terraform plan
terraform apply
```
Outputs: `vpc_id`, `alb_dns_name`, `db_endpoint`, `redis_endpoint`.

## 2. Build and push the Docker image (manual)
```bash
cd docker
docker build -t munnangihari/blackroth-capstone-app:latest .
docker push munnangihari/blackroth-capstone-app:latest
```

## 3. Create the kind cluster (first time only)
```bash
kind create cluster --name blackroth-capstone
```

## 4. Apply Kubernetes manifests
```bash
cd kubernetes
kubectl apply -f namespace.yaml
kubectl apply -f configmap.yaml
kubectl apply -f secret.yaml   # not in git — create locally with real DB password
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

## 5. Verify
```bash
kubectl get pods -n blackroth-capstone
kubectl port-forward -n blackroth-capstone svc/blackroth-service 9090:80
curl http://localhost:9090/health
```

## CI/CD (automated)
Once Jenkins job `blackroth-capstone` is set up (script path
`blackroth-devops-week3/jenkins/Jenkinsfile`), pushing to `main` and clicking
**Build Now** runs the full pipeline: build, scan, push, deploy.
