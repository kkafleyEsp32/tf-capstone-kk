terraform {
  backend "s3" {
    bucket = "boa-terraform-state-im-jan25-kishor"
    key    = "dev-cs/terraform.tfstate"
    region = "ap-south-1"
    encrypt = true
    dynamodb_table = "terraform-locks-kishor"
  }
}