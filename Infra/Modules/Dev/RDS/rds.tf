resource "aws_db_instance" "uamtdevcpsdb" {
  identifier                  = var.db_name
  allocated_storage           = 20
  storage_type                = "gp2"
  engine                      = "postgres" // Changed engine to postgres
  engine_version              = "15.5" // You can choose the desired version
  instance_class              = var.rds_instance_type
  db_name                     = var.db_name
  username                    = var.username
  password                    = var.password
  parameter_group_name        = "default.postgres13" // Parameter group for PostgreSQL
  db_subnet_group_name        = var.db_subnet_group_name
  vpc_security_group_ids      = ["${aws_security_group.db_sg.id}"]
  multi_az                    = false
  skip_final_snapshot         = true
}
