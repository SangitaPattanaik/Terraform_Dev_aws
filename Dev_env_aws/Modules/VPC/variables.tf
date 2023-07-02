variable "region" {}
variable "project_name" {}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
variable "public_subnet_az1_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "private_subnet_az1_cidr" {
  type    = string
  default = "10.0.0.0/16"
}
