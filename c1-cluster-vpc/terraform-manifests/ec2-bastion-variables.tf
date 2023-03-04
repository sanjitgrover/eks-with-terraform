variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "ec2_key_pair" {
    type = string
    default = "terraform-key"
}