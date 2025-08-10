terraform {
  backend "s3" {
    bucket         = "insia-terraform-state-bucket-2025"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

# Test resource to see remote state lock in action
resource "aws_s3_bucket" "test_lock" {
  bucket = "insia-lock-test-bucket-987654" # must be globally unique
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.test_lock.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Add a null_resource with delay to simulate a long-running apply
resource "null_resource" "delay" {
  provisioner "local-exec" {
    command = "echo Waiting for 30 seconds... && sleep 30"
  }
}
