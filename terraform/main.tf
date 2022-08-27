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
  # Credentials provided via environment variables ;)
  # It's no needed to provide directly here
  # It takes env vars AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY as default values
  region = var.region
}

provider "circleci" {
  # Credentials provided via environment variables ;)
  organization = var.organization
  # It's needed to declare token "directly" here
  # But it takes env var CIRCLECI_TOKEN as default value
  api_token = var.circleci_token
}