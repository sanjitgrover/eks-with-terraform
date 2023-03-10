data "terraform_remote_state" "eks" {
  backend = "local"
  config = {
    path = "../../prj1-eks-cluster-on-vpc/terraform-manifests/terraform.tfstate"
  }
}

##We need eks cluster name from Prj-1  
#data.terraform_remote_state.eks.outputs.cluster_id