variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment"
  type        = string
  default     = "test"
}

variable "name" {
  description = "Name to use for resources"
  type        = string
  default     = "terraform-demo"
}

variable "organization" {
  description = "Github organization"
  type        = string
  default     = "LuisDanilo"
}

variable "circleci_cli_token" {
  description = "CircleCI token"
  type        = string
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default = {
    "managed_by" = "terraform"
  }
}