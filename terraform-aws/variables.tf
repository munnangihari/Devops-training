variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "eu-north-1"
}

variable "project_name" {
  description = "Name prefix used to tag/name all resources"
  type        = string
  default     = "devops-week1"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair to attach to the instance (must already exist in the target region)"
  type        = string
  default     = "docker-app-key"
}

variable "ssh_ingress_cidr" {
  description = "CIDR block allowed to SSH into the instance"
  type        = string
  default     = "0.0.0.0/0"
}

variable "app_port" {
  description = "Port the containerized app listens on and that should be opened in the security group"
  type        = number
  default     = 8000
}

variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
  default     = 20
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default = {
    ManagedBy = "terraform"
    Project   = "devops-week1"
  }
}

variable "vpc_id" {
  description = "VPC to launch resources into"
  type        = string
  default     = "vpc-04290bd7509aa2522"
}

variable "subnet_id" {
  description = "Subnet to launch the instance into (must auto-assign public IPs)"
  type        = string
  default     = "subnet-0efac10d912a5b2ec"
}
