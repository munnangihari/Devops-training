resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids         = var.private_subnets
    security_group_ids = [aws_security_group.eks_sg.id]
  }
}

