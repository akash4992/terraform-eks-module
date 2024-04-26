variable "aws_region" {
  type = string
}


variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "key_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_groups" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

variable "enable_public_ip" {
  type = bool
  default = true  # Consider security implications before enabling
}

variable "disk_size" {
  type = number
}

variable "disk_type" {
  type = string
}
