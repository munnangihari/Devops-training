module "network" {
  source = "./modules/network"

  project_name      = var.project_name
  environment       = var.environment
  vpc_cidr          = var.vpc_cidr
  availability_zone = var.availability_zone
  subnet_cidr       = var.subnet_cidr
}
