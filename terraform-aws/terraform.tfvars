aws_region       = "eu-north-1"
project_name     = "devops-week1"
instance_type    = "t3.micro"
key_name         = "docker-app-key"
ssh_ingress_cidr = "0.0.0.0/0"
app_port         = 8000
root_volume_size = 20

tags = {
  ManagedBy = "terraform"
  Project   = "devops-week1"
}
