/*variable "aws_ami" {
    type = string
} */

variable "aws_instance_type" {
    default = "t3.micro"
}

variable "vpc_security_group_id" {}

variable "public_subnet_az1_id" {}

variable "project_name" {}

#variable "aws_key_pair" {}

variable "root_block_device_size" {
  default = 10
}

