# configure aws provider
provider "aws" {
  region  = var.region
  profile = "AWSAdministratorAccess-815622755284"

}

#S3 backend
/*module "tf_state_s3" {
  source = "../Modules/S3"
  s3_bucket_name        = var.s3_bucket_name
  enable_lifecycle_rule = var.enable_lifecycle_rule
  s3_versioning         = var.s3_versioning
}
module "tf_lock_table" {
  source        = "../Modules/dynamoDB"
  db_table_name = var.db_table_name
  billing_mode  = var.billing_mode
  hash_key      = var.hash_key
  attr_name     = var.attr_name
  attr_type     = var.attr_type
} */

#create vpc
module "vpc" {
  source                  = "../Modules/VPC"
  region                  = var.region
  project_name            = var.project_name
  vpc_cidr                = var.vpc_cidr
  public_subnet_az1_cidr  = var.public_subnet_az1_cidr
  private_subnet_az1_cidr = var.private_subnet_az1_cidr
}

#create security group
module "security_group" {
  source = "../Modules/Security-groups"
  vpc_id = module.vpc.vpc_id
}

#create EC2
module "app_instance" {
  source = "../Modules/EC2"

  #aws_ami = var.aws_ami
  aws_instance_type     = var.aws_instance_type
  vpc_security_group_id = module.security_group.vpc_security_group_id
  public_subnet_az1_id  = module.vpc.public_subnet_az1_id
  project_name          = module.vpc.project_name
  #aws_key_pair = var.aws_key_pair
  root_block_device_size = var.root_block_device_size

}
