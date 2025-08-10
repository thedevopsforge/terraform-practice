terraform {
  backend "s3" {
    bucket         = "insia-terraform-state-bucket-2025"
    key            = "terraform.tfstate" # single state file name; workspace adds folder automatically
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}
