variable "aws_region" {
  description = "AWS region for deployment."
  type        = string
  default     = "eu-north-1"

  validation {
    condition     = can(regex("^[a-z]{2}(-gov)?-[a-z]+-[0-9]+$", var.aws_region))
    error_message = "Provide a valid AWS region identifier."
  }
}

variable "project_name" {
  description = "Project name applied to infrastructure tags."
  type        = string
  default     = "blackroth"
}

variable "environment" {
  description = "Deployment environment."
  type        = string

  validation {
    condition     = contains(["dev", "staging", "production"], var.environment)
    error_message = "Environment must be dev, staging, or production."
  }
}

variable "vpc_cidr" {
  description = "IPv4 CIDR range for the VPC."
  type        = string
  default     = "10.40.0.0/16"

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "vpc_cidr must be a valid IPv4 CIDR range."
  }
}

variable "availability_zone" {
  description = "Availability Zone for the example subnet."
  type        = string
  default     = "eu-north-1a"
}

variable "subnet_cidr" {
  description = "IPv4 CIDR range for the example subnet."
  type        = string
  default     = "10.40.1.0/24"

  validation {
    condition     = can(cidrnetmask(var.subnet_cidr))
    error_message = "subnet_cidr must be a valid IPv4 CIDR range."
  }
}
