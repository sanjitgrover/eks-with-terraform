
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  
  backend "s3" {
      bucket=data.terraform_local_state.bucket.outputs.bucket_name.value
      key="${data.terraform_local_state.bucket.outputs.cluster_folder.value}/terraform.tfstate"
      region="us-east-1"
      
      dynamodb_table=data.terraform_local_state.bucket.outputs.cluster_table.value
    }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}
