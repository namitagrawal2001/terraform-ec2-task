terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.27.0"
    }
  }


  backend "s3" {
    bucket = "namit-terraform-state-bucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "namit-terraform-state-table"
  }
}

