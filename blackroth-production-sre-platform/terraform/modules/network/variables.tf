variable "project_name" {
  description = "Project name used in resource tags."
  type        = string
}

variable "environment" {
  description = "Environment name used in resource tags."
  type        = string
}

variable "vpc_cidr" {
  description = "VPC IPv4 CIDR range."
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet IPv4 CIDR range contained within the VPC."
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for the subnet."
  type        = string
}
