
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  
  bucket = "terraform-on-eks-sanjit"
  acl    = "private"

  versioning = {
    enabled = true
  }
}

# resource "aws_s3_object" "env" {
#   bucket       = module.s3-bucket.s3_bucket_id
#   key          = "dev"
#   content_type = "application/x-directory"
# }

resource "aws_s3_object" "cluster" {
  bucket       = module.s3-bucket.s3_bucket_id
  key          = "dev/${var.object_list[0]}/"
  content_type = "application/x-directory"
}

resource "aws_s3_object" "k8s" {
  bucket       = module.s3-bucket.s3_bucket_id
  key          = "dev/${var.object_list[1]}/"
  content_type = "application/x-directory"
}

resource "aws_dynamodb_table" "cluster-table" {
  name           = "dev-ekscluster"
  hash_key       = "LockID"
  billing_mode   = "PROVISIONED"
  read_capacity  = 2
  write_capacity = 2
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    owner        = "IT"
    Environment = "dev"
  }
}

resource "aws_dynamodb_table" "k8s-table" {
  name           = "dev-app1k8s"
  hash_key       = "LockID"
  billing_mode   = "PROVISIONED"
  read_capacity  = 2
  write_capacity = 2
  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    owner        = "IT"
    Environment = "dev"
  }
}