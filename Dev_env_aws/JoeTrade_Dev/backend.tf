# store the terraform state file in s3
/*terraform {
  backend "s3" {
    bucket         = "joetrade-tf-states"
    key            = "s3-backend/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "joetrade-tf-locks"
    encrypt        = true
    profile        = "vscode"
  }
 } */