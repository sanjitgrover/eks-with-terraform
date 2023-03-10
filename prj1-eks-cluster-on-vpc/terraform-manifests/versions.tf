
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  
  backend "s3" {
      # bucket=data.terraform_local_state.bucket.outputs.bucket_name.value
      bucket= "terraform-on-eks-sanjit"
      # key="${data.terraform_local_state.bucket.outputs.cluster_folder.value}/terraform.tfstate"
      key="dev/eks-cluster/terraform.tfstate"
      region="us-east-1"
      
      # dynamodb_table=data.terraform_local_state.bucket.outputs.cluster_table.value
      dynamodb_table="dev-ekscluster"
    }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}
