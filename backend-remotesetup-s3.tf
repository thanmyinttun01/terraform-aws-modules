provider "aws" {
  region = "ap-southeast-1"
}

# 1. Create the S3 Bucket for State Storage
resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-company-tf-state-bucket-unique-123" # MUST BE GLOBALLY UNIQUE
}

# 2. Enable Versioning (Crucial for state file recovery)
resource "aws_s3_bucket_versioning" "state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# 3. Enable Server-Side Encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "state_encryption" {
  bucket = aws_s3_bucket.terraform_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}