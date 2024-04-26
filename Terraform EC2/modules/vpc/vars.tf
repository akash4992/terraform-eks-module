variable "cidr_block" {
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  description = "Name of the VPC"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
}

variable "availability_zone" {
  description = "Availability zone for the subnets"
}
