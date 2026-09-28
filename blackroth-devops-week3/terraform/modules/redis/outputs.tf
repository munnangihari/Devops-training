output "redis_sg_id" {
  value = aws_security_group.redis_sg.id
}

output "redis_endpoint" {
  value = aws_elasticache_cluster.this.cache_nodes[0].address
}
