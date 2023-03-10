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
    
    
  }
  backend "s3" {
      # bucket=data.terraform_local_state.bucket.outputs.bucket_name.value
      bucket= "terraform-on-eks-sanjit"
      # key="${data.terraform_local_state.bucket.outputs.k8s_folder.value}/terraform.tfstate"
      key = "dev/app1k8s/terraform.tfstate"
      region="us-east-1"
      
      # dynamodb_table=data.terraform_local_state.bucket.outputs.k8s_table.value
      dynamodb_table="dev-app1k8s"
      
    }
}