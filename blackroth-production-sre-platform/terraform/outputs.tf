output "vpc_id" {
  description = "ID of the created VPC."
  value       = module.network.vpc_id
}

output "subnet_id" {
  description = "ID of the created subnet."
  value       = module.network.subnet_id
}

output "vpc_cidr" {
  description = "CIDR range assigned to the VPC."
  value       = module.network.vpc_cidr
}
