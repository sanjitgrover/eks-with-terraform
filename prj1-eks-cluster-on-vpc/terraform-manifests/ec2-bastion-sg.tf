module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1"

  name        = "${local.name}-public-bastion-sg"
  description = "Security group with Ingress=HTTP ports open, egress= All "
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp"]
  
  egress_rules = ["all-all"]
  tags = local.common_tags
}