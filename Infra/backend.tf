
terraform {

  backend "s3" {
    bucket = "vitalx-prod-infra-main-tfstate"
    key    = "terraform.tfstate"
    region = "ap-south-1"

  
  }

}

