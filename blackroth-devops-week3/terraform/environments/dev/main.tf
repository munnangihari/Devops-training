module "vpc" {
  source      = "../../modules/vpc"
  environment = var.environment
}

module "rds" {
  source                  = "../../modules/rds"
  environment             = var.environment
  subnet_ids              = module.vpc.subnet_ids
  vpc_security_group_ids  = [module.vpc.rds_sg_id]
  db_username              = var.db_username
  db_password              = var.db_password
}

module "alb" {
  source      = "../../modules/alb"
  environment = var.environment
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.subnet_ids
}

module "redis" {
  source     = "../../modules/redis"
  environment = var.environment
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.subnet_ids
  app_sg_id  = module.vpc.app_sg_id
}
