# Blackroth DevOps Week 3 Capstone

FastAPI app deployed to Kubernetes (kind), backed by AWS infrastructure
(VPC, ALB, RDS, Redis) provisioned via Terraform, with a Jenkins CI/CD
pipeline for build, scan, and deploy.

## Structure

terraform/     - AWS infra (vpc, alb, rds, redis modules)
docker/        - FastAPI app + Dockerfile
kubernetes/    - namespace, deployment, service, configmap, secret
jenkins/       - Jenkinsfile (CI/CD pipeline)
scripts/       - deploy.sh, health-check.sh
docs/          - architecture, deployment guide, troubleshooting

## Quick start
See docs/deployment.md for full setup steps.

## Live infra (dev environment)
- ALB: dev-alb-52065406.us-east-1.elb.amazonaws.com
- Docker image: munnangihari/blackroth-capstone-app:latest

## CI/CD
Jenkins job blackroth-capstone runs: Checkout -> Unit Tests -> Docker
Build -> Trivy Scan -> Push to Docker Hub -> Deploy to kind.
