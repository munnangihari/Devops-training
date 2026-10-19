variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_id" {
  description = "VPC ID where EKS cluster will be created"
  type        = string
  default     = "vpc-02ec52fda5d1e2dba"
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC"
  type        = string
  default     = "10.0.0.0/16" # adjust if your VPC uses a different CIDR
}

variable "private_subnets" {
  description = "Subnets for EKS cluster and node groups"
  type        = list(string)
  default = [
    "subnet-0cf7719a51e276a89", # ap-south-1a
    "subnet-08bb3dc04509f03c5", # ap-south-1b
    "subnet-06737e987d4fd2e85"  # ap-south-1c
  ]
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "blackroth-eks"
}

variable "cluster_role_arn" {
  description = "IAM role ARN for EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "IAM role ARN for EKS node group"
  type        = string
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  type        = string
  default     = "t3.medium"
}

variable "desired_capacity" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 3
}

