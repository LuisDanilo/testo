data "aws_caller_identity" "current" {

}

# Create AWS IAM user
resource "aws_iam_user" "circleci_user" {
  name = "${var.name}-user"
  tags = var.tags
}

# Create key
resource "aws_iam_access_key" "aws_access_key" {
  depends_on = [aws_iam_user.circleci_user]
  user       = aws_iam_user.circleci_user.name
}

# Policy document
data "aws_iam_policy_document" "circleci_user_policy_document" {
  statement {
    effect = "Allow"
    actions = [
      "ecr:PutLifecyclePolicy",
      "ecr:PutImageTagMutability",
      "ecr:DescribeImageScanFindings",
      "ecr:StartImageScan",
      "ecr:GetLifecyclePolicyPreview",
      "ecr:GetDownloadUrlForLayer",
      "ecr:ListTagsForResource",
      "ecr:UploadLayerPart",
      "ecr:ListImages",
      "ecr:PutImage",
      "ecr:UntagResource",
      "ecr:BatchGetImage",
      "ecr:DescribeImages",
      "ecr:TagResource",
      "ecr:DescribeRepositories",
      "ecr:StartLifecyclePolicyPreview",
      "ecr:InitiateLayerUpload",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetRepositoryPolicy",
      "ecr:GetLifecyclePolicy",
      "ecr:GetAuthorizationToken",
      "ecr:CompleteLayerUpload"
    ]
    resources = [aws_ecr_repository.ecr_repo.arn]
  }

  statement {
    effect = "Allow"
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:BatchCheckLayerAvailability"
    ]
    resources = ["*"]
  }
}

# Create policy from document
resource "aws_iam_user_policy" "circleci_user_policy" {
  name   = "${var.name}-policy"
  user   = aws_iam_user.circleci_user.name
  policy = data.aws_iam_policy_document.circleci_user_policy_document.json
}

# Create CircleCI context
resource "circleci_context" "circleci_user_context" {
  depends_on   = [aws_iam_user.circleci_user]
  name         = "${var.name}-${var.environment}"
  organization = var.organization
}

# Add AWS access key to CircleCI context
resource "circleci_context_environment_variable" "aws_access_key_id" {
  depends_on   = [circleci_context.circleci_user_context]
  variable     = "AWS_ACCESS_KEY_ID"
  value        = aws_iam_access_key.aws_access_key.id
  context_id   = circleci_context.circleci_user_context.id
  organization = var.organization
}

# Add AWS secret access key to CircleCI context
resource "circleci_context_environment_variable" "aws_secret_access_key" {
  depends_on   = [circleci_context.circleci_user_context]
  variable     = "AWS_SECRET_ACCESS_KEY"
  value        = aws_iam_access_key.aws_access_key.secret
  context_id   = circleci_context.circleci_user_context.id
  organization = var.organization
}

# Add AWS default region to CircleCI context
resource "circleci_context_environment_variable" "aws_default_region" {
  depends_on   = [circleci_context.circleci_user_context]
  variable     = "AWS_DEFAULT_REGION"
  value        = var.region
  context_id   = circleci_context.circleci_user_context.id
  organization = var.organization
}

# Add AWS ECR account id to CircleCI context
resource "circleci_context_environment_variable" "aws_ecr_account_id" {
  depends_on   = [circleci_context.circleci_user_context]
  variable     = "AWS_ECR_ACCOUNT_ID"
  value        = data.aws_caller_identity.current.account_id
  context_id   = circleci_context.circleci_user_context.id
  organization = var.organization
}