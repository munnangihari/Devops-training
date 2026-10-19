resource "aws_db_instance" "hrms_db" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = "hrmsdb"
  username             = "admin"
  password             = "MyPassword123"
  skip_final_snapshot  = true
  vpc_security_group_ids = [] # add SG later
}

