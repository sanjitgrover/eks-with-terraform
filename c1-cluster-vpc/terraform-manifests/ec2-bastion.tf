module "ec2_public" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

  name = "BastionHost-${local.name}"

  ami                    = data.aws_ami.amz-linux2.id
  instance_type          = var.instance_type
  key_name               = var.ec2_key_pair
#   monitoring             = true
  subnet_id              = module.vpc.public_subnets[0]
  vpc_security_group_ids = [module.public_bastion_sg.security_group_id]
  

  tags =local.common_tags
}