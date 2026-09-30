region       = "eu-north-1"
cluster_name = "blackroth-eks"

vpc_id   = "vpc-04290bd7509aa2522"
vpc_cidr = "10.0.0.0/16"

private_subnets = [
  "subnet-0efac10d912a5b2ec", # eu-north-1a
  "subnet-04020ed878e519ae6", # eu-north-1b
  "subnet-010dc5980a5ecc37b"  # eu-north-1c
]

cluster_role_arn = "arn:aws:iam::091199627403:role/blackroth-eks-cluster-role"
node_role_arn    = "arn:aws:iam::091199627403:role/blackroth-eks-node-role"

