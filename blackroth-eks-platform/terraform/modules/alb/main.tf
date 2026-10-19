resource "aws_lb" "this" {
  name               = "${var.env}-alb"
  internal           = var.alb_internal
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  security_groups    = [var.sg_id]
}

