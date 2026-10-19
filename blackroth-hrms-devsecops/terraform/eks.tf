module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "18.31.2"

  cluster_name    = "hrms-eks"
  cluster_version = "1.29"

  vpc_id  = aws_vpc.main.id
  subnets = [aws_subnet.public.id, aws_subnet.private.id]

  node_groups = {
    default = {
      desired_capacity = 2
      min_capacity     = 1
      max_capacity     = 3
      instance_type    = "t3.medium"
    }
  }
}

