variable "REGION" {
  description = "AWS region"
  default     = "ap-south-1"  # Change this to your desired default region
}


variable "instance_type" {
  description = "The instance type for the EC2 instance"
  default =  "t2.small"

}

variable "vpc_name" {
  description = "The name of the VPC"
  default =  "vitalx_prod-main-01"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
   default = "ami-0a1b648e2cd533174"
}


variable "key_name" {
  description = "The name of the key pair to use for the EC2 instance"
  default = "vitalx-prod-runner-01"
}





variable "tags" {
  description = "A map of tags to assign to the EC2 instance"
  type        = map(string)
  default = {
    "Name" = "vitalx-prod-action"
  }
}

variable "enable_public_ip" {
  description = "Whether to associate a public IP address with the instance"
  type        = bool
  default     = true
}

variable "disk_size" {
  description = "The size of the disk in gigabytes"
  type        = number
  default     = 30
}

variable "disk_type" {
  description = "The type of disk (e.g., standard, gp2, io1)"
  type        = string
  default     = "gp2"
}
