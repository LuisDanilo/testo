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

variable "tags" {
  description = "Tags"
  type        = map(string)
  default = {
    "managed_by" = "terraform"
  }
}

variable "vpc_cidr" {
  description = "VPC cidr"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_subnet_1_cidr" {
  description = "VPC subnet 1 cidr"
  type        = string
  default     = "10.0.1.0/24"
}

variable "vpc_subnet_2_cidr" {
  description = "VPC subnet 2 cidr"
  type        = string
  default     = "10.0.2.0/24"
}

variable "vpc_subnet_3_cidr" {
  description = "VPC subnet 2 cidr"
  type        = string
  default     = "10.0.3.0/24"
}

# Variables loaded using env vars

variable "circleci_token" {
  description = "CircleCI token"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}