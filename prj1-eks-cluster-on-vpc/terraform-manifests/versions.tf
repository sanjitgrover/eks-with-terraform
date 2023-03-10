
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  
  backend "s3" {
      bucket="terraform-on-eks-sanjit"
      key="dev/eks-cluster/terraform.tfstate"
      region="us-east-1"
      
      dynamodb_table="dev-ekscluster"
    }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}
