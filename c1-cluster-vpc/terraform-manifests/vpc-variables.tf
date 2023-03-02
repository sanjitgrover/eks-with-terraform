variable "vpc_name" {
    type = string
    default = "my-vpc"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "vpc_private_subnets" {
    type = string
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets" {
    type = string
    default = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "vpc_db_subnets" {
    type = string
    default = ["10.0.21.0/24", "10.0.22.0/24"]
}

