# Environment
prefix = "Prod"
common_tags = {
  Terraform   = "true"
  Environment = "prod"
  Application = "techtalk"
}

application = "Techtalk"
domain      = "example.com" # Colocar tu dominio

# VPC
vpc_name = "VPC-Prod"
vpc_cidr = "10.21.0.0/16"
vpc_azs = [
  "us-east-2a",
  "us-east-2b",
  "us-east-2c"
]
vpc_public_subnets = [
  "10.21.11.0/24",
  "10.21.12.0/24",
  "10.21.13.0/24"
]
vpc_private_subnets = [
  "10.21.21.0/24",
  "10.21.22.0/24",
  "10.21.23.0/24"
]
vpc_database_subnets = [
  "10.21.31.0/24",
  "10.21.32.0/24",
  "10.21.33.0/24"
]
vpc_tags = {
  Terraform   = "true"
  Environment = "prod"
}

# EC2
ec2_type  = "t4g.micro"
ec2_count = 2
ec2_key   = "amz_keys"

my_public_ip = "0.0.0.0/0"