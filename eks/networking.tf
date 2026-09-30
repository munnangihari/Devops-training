resource "aws_eip" "nat" {
  domain = "vpc"

  tags = {
    Name = "${var.cluster_name}-nat-eip"
  }
}

resource "aws_nat_gateway" "eks_nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = "subnet-0efac10d912a5b2ec" # public subnet, routed via igw-07079c1fe9f94935b

  tags = {
    Name = "${var.cluster_name}-nat"
  }
}

resource "aws_route_table" "private" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.eks_nat.id
  }

  tags = {
    Name = "${var.cluster_name}-private-rt"
  }
}

resource "aws_route_table_association" "private" {
  for_each = toset([
    "subnet-04020ed878e519ae6",
    "subnet-010dc5980a5ecc37b"
  ])
  subnet_id      = each.value
  route_table_id = aws_route_table.private.id
}
