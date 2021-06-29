############################
# Input variable definitions
variable "prefix" {
  description = "Prefijo según Ambiente: Prod, Desa, Test"
  type        = string
}

variable "common_tags" {
  description = "Common Tags"
  type        = map(string)
}

variable "application" {
  description = "Nombre de aplicacion Web / Subdominio"
  type        = string
}

variable "domain" {
  description = "Nombre de dominio"
  type        = string
}

# VPC vars
variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "Bloque CIDR para la VPC"
  type        = string
}

variable "vpc_azs" {
  description = "Zonas de disponibilidad para la VPC"
  type        = list(string)
}

variable "vpc_public_subnets" {
  description = "SubRedes públicas para la VPC"
  type        = list(string)
}

variable "vpc_private_subnets" {
  description = "SubRedes privadas para la VPC"
  type        = list(string)
}

variable "vpc_database_subnets" {
  description = "SubRedes de Base de Datos para la VPC"
  type        = list(string)
}

variable "vpc_enable_nat_gateway" {
  description = "Habilita Nat Gateway para la VPC"
  type        = bool
  default     = true
}

variable "vpc_single_nat_gateways" {
  description = "NAT Gateway único para la VPC"
  type        = bool
  default     = true
}

variable "vpc_enable_vpn_gateway" {
  description = "Crear VPN Gateway"
  type        = bool
  default     = false
}

variable "vpc_tags" {
  description = "Tags para aplicar a los recursos creados por el módulo de VPC"
  type        = map(string)
}

variable "vpc_private_subnet_tags" {
  description = "Tags adicionales para aplicar a SubRedes Privadas"
  type        = map(string)
  default = {
    Subnet_type = "private"
  }
}

variable "vpc_public_subnet_tags" {
  description = "Tags adicionales para aplicar a SubRedes Públicas"
  type        = map(string)
  default = {
    Subnet_type = "public"
  }
}

variable "vpc_database_subnet_tags" {
  description = "Tags adicionales para aplicar a SubRedes de Base de Datos"
  type        = map(string)
  default = {
    Subnet_type = "database"
  }
}

# EC2 vars
variable "ec2_ami" {
  description = "AMI base para instancias EC2 Web"
  type        = string
  default     = "ami-07a3e3eda401f8caa" #Amazon Linux 2 AMI (HVM), SSD Volume Type (ARM)
}

variable "ec2_type" {
  description = "Tipo instancia EC2"
  type        = string
  default     = "t4g.nano"
}

variable "ec2_count" {
  description = "Cantidad de instancias para el Target Group"
  type        = number
  default     = 1
}

variable "ec2_key" {
  description = "EC2 Key pair"
  type        = string
}

variable "my_public_ip" {
  description = "Mi IP publica"
  type        = string
}