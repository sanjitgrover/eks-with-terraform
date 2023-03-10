terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.18"
    }
    backend "s3" {
      bucket=data.terraform_local_state.bucket.outputs.bucket_name.value
      key="${data.terraform_local_state.bucket.outputs.k8s_folder.value}/terraform.tfstate"
      region="us-east-1"
      
      dynamodb_table=data.terraform_local_state.bucket.outputs.k8s_table.value
    }
  }
}