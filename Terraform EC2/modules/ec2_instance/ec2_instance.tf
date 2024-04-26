
resource "aws_instance" "main" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = var.security_groups
  tags          = var.tags
  associate_public_ip_address = var.enable_public_ip
  availability_zone  = "${var.aws_region}a"

  root_block_device {
    volume_size = var.disk_size
    volume_type = var.disk_type
    encrypted             = true
    delete_on_termination = false
  }

}


