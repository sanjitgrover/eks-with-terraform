resource "null_resource" "copy_ec2_keys" {
    depends_on = [module.ec2_public]
    
    connection{
        type = "ssh"
        host = aws_eip.bastion_eip.public_ip
        user = "ec2-user"
        password = ""
        private_key = file("private/terraform-key.pem")
    }
    
    provisioner "file" {
        source = "private/terraform-key.pem"
        destination = "/tmp/terraform-key.pem"
    }
    
    //Remote Provisioner
    provisioner "remote-exec" {
        inline = [
            "sudo chmod 400 /tmp/terraform-key.pem"
        ]
    }
    
    provisioner "local-exec" {
        command = "echo VPC created on `date` with ID: ${module.vpc.vpc_id} >> creation_time_vpc.txt"
        working_dir = "local-logs"
    }
}