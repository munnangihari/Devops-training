module "vpc" {
  source          = "../../modules/vpc"
  env             = var.env
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

module "eks" {
  source       = "../../modules/eks"
  env          = var.env
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnet_ids
  cluster_name = "${var.env}-eks"
}

module "rds" {
  source      = "../../modules/rds"
  env         = var.env
  vpc_id      = module.vpc.vpc_id
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  sg_id       = var.sg_id
}

module "redis" {
  source          = "../../modules/redis"
  env             = var.env
  vpc_id          = module.vpc.vpc_id
  redis_node_type = var.redis_node_type
}

module "alb" {
  source       = "../../modules/alb"
  env          = var.env
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.public_subnet_ids
  sg_id        = var.sg_id
  alb_internal = var.alb_internal
}

