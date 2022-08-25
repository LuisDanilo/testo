## Who will provide infrastructure? AWS in this case
provider "aws" {
    region = var.region
}

provider "docker" {
    ## Registry auth allow docker provider connectivity with aws ecr
    ## Address defined on locals 
    ## Username and password for login to AWS ECR 
    ## and be able to push docker images 
    registry_auth {
        address = local.aws_ecr_url
        username = data.aws_ecr_authorization_token.token.user_name
        password = data.aws_ecr_authorization_token.token.password
    }
}