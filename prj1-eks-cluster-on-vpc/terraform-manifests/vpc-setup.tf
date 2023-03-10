//https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones

data "aws_availability_zones" "available" {
#   state = "available"
}


// https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/3.19.0
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"
  
  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr

  azs                 = data.aws_availability_zones.available.names
  private_subnets     = var.vpc_private_subnets
  public_subnets      = var.vpc_public_subnets
  database_subnets    = var.vpc_db_subnets
  

  create_database_subnet_group = var.create_database_subnet_group

  
  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway

 
  tags = local.common_tags
  vpc_tags = local.common_tags
  
  public_subnet_tags = {
    Type = "Public Subnets"
    "kubernetes.io/role/elb" = 1
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }
  
  private_subnet_tags = {
    Type = "Private Subnets"
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/${local.eks_cluster_name}" = "shared"
  }
  
  database_subnet_tags = {
    Type = "Database Subnets"
  }
}


