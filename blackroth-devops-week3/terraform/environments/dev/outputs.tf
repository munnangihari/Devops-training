output "vpc_id" {
  value = module.vpc.vpc_id
}

output "app_sg_id" {
  value = module.vpc.app_sg_id
}

output "db_endpoint" {
  value = module.rds.db_endpoint
}

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "redis_endpoint" {
  value = module.redis.redis_endpoint
}
