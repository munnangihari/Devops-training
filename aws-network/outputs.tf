output "vpc_id" {
  description = "VPC ID"
  value       = data.aws_vpc.main.id
}

output "vpc_cidr" {
  description = "VPC CIDR"
  value       = data.aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = data.aws_subnets.default_vpc.ids
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = []
}

output "application_security_group_id" {
  description = "Application security group ID"
  value       = aws_security_group.application.id
}
