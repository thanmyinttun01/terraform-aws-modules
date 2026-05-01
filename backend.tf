terraform {
  backend "s3" {
    # The bucket you created in Part 1
    bucket  = "my-company-tf-state-bucket-unique-123"
    key     = "ec2-project/terraform.tfstate"
    region  = "ap-southeast-1"
    encrypt = true

    # Native S3 state locking
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-1"
}
