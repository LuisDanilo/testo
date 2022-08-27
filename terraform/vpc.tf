# VPC
resource "aws_vpc" "terraform_demo_vpc" {
  cidr_block = var.vpc_cidr
}

# Public subnet
resource "aws_subnet" "terraform_demo_subnet_1" {
  vpc_id            = aws_vpc.terraform_demo_vpc.id
  cidr_block        = var.vpc_subnet_1_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "Public subnet #1"
  }
}

# Public subnet
resource "aws_subnet" "terraform_demo_subnet_2" {
  vpc_id            = aws_vpc.terraform_demo_vpc.id
  cidr_block        = var.vpc_subnet_2_cidr
  availability_zone = "us-east-1b"
  tags = {
    Name = "Public subnet #2"
  }
}

# Private subnet
resource "aws_subnet" "terraform_demo_subnet_3" {
  vpc_id            = aws_vpc.terraform_demo_vpc.id
  cidr_block        = var.vpc_subnet_3_cidr
  availability_zone = "us-east-1a"
  tags = {
    Name = "Private subnet #1"
  }
}