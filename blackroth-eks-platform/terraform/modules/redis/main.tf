resource "aws_elasticache_cluster" "this" {
  cluster_id           = "${var.env}-redis"
  engine               = "redis"
  node_type            = var.redis_node_type
  num_cache_nodes      = 1
  parameter_group_name = "default.redis6.x"
}

