# Architecture

## Overview
Blackroth DevOps Week 3 capstone: a FastAPI app deployed to a local Kubernetes
cluster (kind), backed by AWS-managed infrastructure provisioned with Terraform,
built and deployed through a Jenkins CI/CD pipeline.

## Components

### Terraform (AWS infrastructure)
- **VPC module**: uses the account's default VPC, owns `app_sg` (app/SSH ingress)
  and `rds_sg` (Postgres ingress restricted to `app_sg`).
- **ALB module**: Application Load Balancer, target group (port 8000), HTTP
  listener on port 80. Owns its own `alb_sg`.
- **RDS module**: Postgres 15 instance (`db.t3.micro`), private, only reachable
  from `app_sg`.
- **Redis module**: ElastiCache Redis 7.1 (`cache.t3.micro`), private, owns its
  own `redis_sg`, reachable only from `app_sg`.

### Docker
- `python:3.11-alpine` base image, FastAPI app on port 8000, healthcheck on `/`.

### Kubernetes (kind, local)
- Namespace: `blackroth-capstone`
- ConfigMap: non-secret app config (DB/Redis hosts, ports)
- Secret: DB credentials (gitignored, applied manually)
- Deployment: 2 replicas, liveness/readiness probes on `/health`
- Service: ClusterIP on port 80 -> container port 8000

### CI/CD (Jenkins)
Pipeline stages: Checkout -> Unit Tests -> Docker Build -> Trivy Scan ->
Push to Docker Hub -> Deploy to kind (`kubectl set image` + rollout status).

## Data flow
Developer pushes to GitHub -> Jenkins builds and scans the image -> pushes to
Docker Hub -> updates the kind deployment -> pods pull the new image and roll
out -> app is reachable via the ClusterIP service (and, in the AWS-hosted
version, would sit behind the ALB).
