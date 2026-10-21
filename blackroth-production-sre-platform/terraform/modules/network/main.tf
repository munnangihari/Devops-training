resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.project_name}-${var.environment}-vpc"
  }
}

resource "aws_subnet" "this" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.project_name}-${var.environment}-subnet"
  }
  lifecycle {
    precondition {
      condition = (
        tonumber(split("/", var.subnet_cidr)[1]) >= tonumber(split("/", var.vpc_cidr)[1]) &&
        cidrsubnet(
          var.vpc_cidr,
          tonumber(split("/", var.subnet_cidr)[1]) - tonumber(split("/", var.vpc_cidr)[1]),
          0
        ) == var.subnet_cidr
      )
      error_message = "The subnet CIDR must be a valid subnet within the VPC CIDR."
    }
  }
}
