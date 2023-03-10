data "terraform_local_state" "bucket" {
   backend = "local"
   config = {
     path = "../../initial-backend-setup/terraform-manifests/terraform.tfstate"
   }
  
}