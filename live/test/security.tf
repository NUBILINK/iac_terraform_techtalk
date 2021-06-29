##########################
# Crea grupos de seguridad
module "security_groups" {
  source = "../../modules/security_groups"

  prefix = var.prefix
  vpc_id = module.vpc.vpc_id

  admin_cidr_blocks = [
    var.my_public_ip
  ]
  privateweb_cidr_blocks = concat(
    var.vpc_private_subnets,
    var.vpc_public_subnets,
  )

  common_tags = var.common_tags
}