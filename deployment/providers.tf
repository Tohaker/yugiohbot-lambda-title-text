provider "aws" {
  profile = "terraform-deployer"
  region  = "eu-west-2"
}

terraform {
  backend "s3" {
    bucket  = "021651181835-terraform-state"
    key     = "lambda_title_text.tfstate"
    region  = "eu-west-2"
  }
}

data "aws_caller_identity" "current" {}
