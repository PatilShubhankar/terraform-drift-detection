terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.13.0"
    }
  }
  required_version = "~> 1.5.0"
  backend "s3" {
    bucket = "shubhankar-terraform-state-bucket"
    key = "terraform-drift-detection-project"
    region = "eu-north-1"
    profile = "terraform"
  }
}



provider "aws" {
    region = "eu-north-1"
    profile = "terraform"
}




