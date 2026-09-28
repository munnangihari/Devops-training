# AWS EC2 Deployment

## Instance Details
- Region: eu-north-1 (Stockholm)
- Instance: docker-app-se... (i-00f6ccc881d9423d9)
- Public IP: 16.171.0.212
- OS: Ubuntu 24.04.4 LTS
- Key pair name: docker-app-key
- SSH user: ubuntu

## Prerequisites
- Docker installed on the EC2 instance
- Security group allows inbound traffic on port 8000 (app) and port 22 (SSH)
- Private key `docker-app-key.pem` available locally with permissions set to 400:
```bash
  chmod 400 docker-app-key.pem
```

## Manual Deployment

From the project root on your local machine:

```bash
# Build and push the image (only needed if code changed)
docker build -t devops-week1-app .
docker tag devops-week1-app munnangihari/devops-week1-app:latest
docker push munnangihari/devops-week1-app:latest

# Deploy to EC2
ssh -i ~/docker-app-key.pem ubuntu@16.171.0.212 "bash -s" < scripts/deploy.sh

# Verify health
ssh -i ~/docker-app-key.pem ubuntu@16.171.0.212 "PORT=8000 bash -s" < scripts/health-check.sh
```

## Verifying from outside EC2

```bash
curl http://16.171.0.212:8000/health
curl http://16.171.0.212:8000/
```

## Notes
- `deploy.sh` and `health-check.sh` both support IMAGE, CONTAINER_NAME, and PORT environment variables with sensible defaults (see scripts/ for details).
- A Jenkinsfile exists in the repo with a full CI/CD pipeline (Unit Tests → Docker Build → Push → Deploy → Health Check), but manual deployment via SSH is the currently confirmed working method.
