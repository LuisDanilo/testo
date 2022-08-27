resource "aws_internet_gateway" "terraform_demo_internet_gateway" {
  vpc_id = aws_vpc.terraform_demo_vpc.id
  tags = {
    Name = "Internet gateway"
  }
}