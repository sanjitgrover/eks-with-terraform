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
      bucket="terraform-on-eks-sanjit"
      key="dev/app1k8s/terraform.tfstate"
      region="us-east-1"
      
      dynamodb_table="dev-app1k8s"
    }
  }
}