variable "region" {
    description = "AWS region to create resources in"
    type = string
    default = "us-east-1"
}

variable "repository_list" {
    description = "List of repository names"
    type = list
    default = ["backend", "worker"]
}