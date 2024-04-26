module "vpc" {
  source               = "./modules/vpc"
  cidr_block           = "10.0.0.0/16"
  vpc_name             = var.vpc_name
  public_subnet_cidr   = "10.0.0.0/24"
  private_subnet_cidr  = "10.0.1.0/24"
  availability_zone    = "${var.REGION}a"
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}


module "ec2" {
  
  source            = "./modules/ec2_instance"
  aws_region         = var.REGION
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  subnet_id         = module.vpc.public_subnet_id
  security_groups =  [module.security_group.id]
  tags              = var.tags
  enable_public_ip  = var.enable_public_ip
  disk_size         = var.disk_size
  disk_type         = var.disk_type
}
