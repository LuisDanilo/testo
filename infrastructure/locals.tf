
locals {
    tags = {
        created_by = "terraform"
    }
    ## Region defined on terraform variables
    ## Account id defined on data references
    aws_ecr_url = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${var.region}.amazonaws.com"
}