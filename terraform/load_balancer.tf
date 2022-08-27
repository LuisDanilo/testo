resource "aws_lb" "terraform_demo_load_balancer" {
  load_balancer_type = "application"
  subnets = [
    aws_subnet.terraform_demo_subnet_1.id,
    aws_subnet.terraform_demo_subnet_2.id
  ]
  enable_deletion_protection = false
  tags = {
    Name = "Load balancer"
  }
}