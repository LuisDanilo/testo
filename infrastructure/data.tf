# Data reference for AWS account id
data "aws_caller_identity" "current" {}


## Data reference for ECR authorization token
data "aws_ecr_authorization_token" "token" {}