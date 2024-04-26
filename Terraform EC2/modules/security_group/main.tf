
resource "aws_security_group" "instance_sg" {
  name        = var.security_name
  description = "Security group for EC2 instance"
  vpc_id      = var.vpc_id

  # Define your security group rules here
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
