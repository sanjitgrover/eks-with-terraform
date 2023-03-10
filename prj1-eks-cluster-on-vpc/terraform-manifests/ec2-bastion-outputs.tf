output "ec2_bastion_public_ids" {
    value = module.ec2_public.id
}

output "ec2_bastion_public_ip" {
    value = aws_eip.bastion_eip.public_ip
}