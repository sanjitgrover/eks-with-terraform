data "terraform_remote_state" "bucket" {
   backend = "local"
   config = {
     path = "../../initial-backend-setup/terraform-manifests/terraform.tfstate"
   }
  
}