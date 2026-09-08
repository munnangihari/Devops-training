# terraform-aws

Terraform configuration that provisions a single EC2 instance (Ubuntu 22.04)
along with the supporting security group and IAM role needed to run and
monitor a containerized app, modeled on the devops-week1-project setup
(FastAPI app on port 8000, CloudWatch logging).

## Usage

terraform init
terraform plan
terraform apply
terraform output ssh_command

## Teardown

terraform destroy
