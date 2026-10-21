output "vpc_id" {
  description = "Created VPC identifier."
  value       = aws_vpc.this.id
}

output "subnet_id" {
  description = "Created subnet identifier."
  value       = aws_subnet.this.id
}

output "vpc_cidr" {
  description = "Configured VPC CIDR range."
  value       = aws_vpc.this.cidr_block
}
