resource "aws_db_instance" "this" {
  identifier        = "${var.env}-rds"
  engine            = "postgres"
  instance_class    = "db.t3.micro"
  allocated_storage = 20
  db_name           = var.db_name   
  username          = var.db_username
  password          = var.db_password
  skip_final_snapshot = true
  vpc_security_group_ids = [var.sg_id]
}

