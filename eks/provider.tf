provider "aws" {
  region = var.region

  assume_role {
    role_arn     = "arn:aws:iam::091199627403:role/AdminAccessRole"
    session_name = "terraform-eks-session"
  }
}

