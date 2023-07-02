region                  = "ap-southeast-1"
project_name            = "JoeTrade_Dev"
vpc_cidr                = "10.0.0.0/16"
public_subnet_az1_cidr  = "10.0.0.0/24"
private_subnet_az1_cidr = "10.0.1.0/24"

# S3
s3_bucket_name        = "joetrade-tf-states"
s3_versioning         = "Enabled"
enable_lifecycle_rule = false

db_table_name = "joetrade-tf-locks"
billing_mode  = "PAY_PER_REQUEST"
hash_key      = "LockID"
attr_name     = "LockID"
attr_type     = "S"