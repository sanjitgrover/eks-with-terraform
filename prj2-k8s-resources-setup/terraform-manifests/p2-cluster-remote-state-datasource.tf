data "terraform_remote_state" "bucket" {
   backend = "local"
   config = {
     path = "../../initial-backend-setup/terraform-manifests/terraform.tfstate"
   }
  
}

data "terraform_remote_state" "eks" {
  # backend = "local"
  # config = {
  #   path = "../../prj1-eks-cluster-on-vpc/terraform-manifests/terraform.tfstate"
  # }
  backend="s3"
  config = {
    bucket=data.terraform_local_state.bucket.outputs.bucket_name.value
      key="${data.terraform_local_state.bucket.outputs.cluster_folder.value}/terraform.tfstate"
      region="us-east-1"
  }
}

##We need eks cluster name from Prj-1  
#data.terraform_remote_state.eks.outputs.cluster_id