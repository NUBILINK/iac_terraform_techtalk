# Environment
prefix = "Test"
common_tags = {
  Terraform   = "true"
  Environment = "test"
  Application = "techtalk"
}

application = "Techtalk"
domain      = "example.com" # Colocar tu dominio

# VPC
vpc_name = "VPC-Test"
vpc_cidr = "10.20.0.0/16"
vpc_azs = [
  "us-east-2a",
  "us-east-2b",
  "us-east-2c"
]
vpc_public_subnets = [
  "10.20.11.0/24",
  "10.20.12.0/24",
  "10.20.13.0/24"
]
vpc_private_subnets = [
  "10.20.21.0/24",
  "10.20.22.0/24",
  "10.20.23.0/24"
]
vpc_database_subnets = [
  "10.20.31.0/24",
  "10.20.32.0/24",
  "10.20.33.0/24"
]
vpc_tags = {
  Terraform   = "true"
  Environment = "test"
}

# EC2
ec2_type  = "t4g.micro"
ec2_count = 1
ec2_key   = "amz_keys"

my_public_ip = "0.0.0.0/0"