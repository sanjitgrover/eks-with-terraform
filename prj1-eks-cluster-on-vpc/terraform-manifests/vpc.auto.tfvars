vpc_name="my-vpc"
vpc_cidr= "10.0.0.0/16"
vpc_private_subnets= ["10.0.1.0/24", "10.0.2.0/24"]
vpc_public_subnets= ["10.0.11.0/24", "10.0.12.0/24"]
vpc_db_subnets= ["10.0.21.0/24", "10.0.22.0/24"]
create_database_subnet_group = true
enable_nat_gateway = true
single_nat_gateway = true
