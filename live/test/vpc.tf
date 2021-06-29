#####
# VPC
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs              = var.vpc_azs
  private_subnets  = var.vpc_private_subnets
  public_subnets   = var.vpc_public_subnets
  database_subnets = var.vpc_database_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateways

  enable_vpn_gateway = var.vpc_enable_vpn_gateway
  vpn_gateway_az     = var.vpc_azs[0]

  enable_dns_hostnames = true

  tags                 = var.vpc_tags
  public_subnet_tags   = var.vpc_public_subnet_tags
  private_subnet_tags  = var.vpc_private_subnet_tags
  database_subnet_tags = var.vpc_database_subnet_tags
}
