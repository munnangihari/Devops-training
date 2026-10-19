resource "aws_eks_node_group" "default" {
  cluster_name    = var.cluster_name
  node_group_name = "default"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.private_subnets

  scaling_config {
    desired_size = 2   # only 1 node for speed
    min_size     = 1
    max_size     = 3
  }

  instance_types = ["t3.small"] # smaller instance launches faster

  tags = {
    Name = "${var.cluster_name}-node-group"
  }

  depends_on = [aws_eks_cluster.this]
}

