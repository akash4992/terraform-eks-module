
terraform {

  backend "s3" {
    bucket = "my-vitalx-dev-ap-south-1-tfstates"
    key    = "terraform.tfstate"
    region = "ap-south-1"

  
  }

}

