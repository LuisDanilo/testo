terraform {
  backend "s3" {
    bucket = "ldanilo-tfstates"
    key    = "tf-circleci-ecr-demo"
    region = "us-east-1"
  }
  required_providers {
    circleci = {
      source  = "mrolla/circleci"
      version = "0.4.0"
    }
  }
}

provider "aws" {
  profile = "luisdanilo"
  region  = var.region
}

provider "circleci" {
  api_token    = var.circleci_cli_token
  organization = var.organization
}