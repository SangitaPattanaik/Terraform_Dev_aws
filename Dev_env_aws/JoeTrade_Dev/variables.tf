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

/*variable "aws_ami" {
    type = string
} */

variable "aws_instance_type" {
    default = "t3.micro"
}

#variable "aws_key_pair" {}

variable "root_block_device_size" {
  default = 10
}
