# Input variable definitions
variable "prefix" {
  description = "Prefijo según Ambiente: Prod, Desa, Test"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "admin_cidr_blocks" {
  description = "CIDR blocks para permitir acceso Administrativo"
  type        = list(string)
  default     = []
}

variable "postgres_cidr_blocks" {
  description = "CIDR blocks para permitir acceso a Postgres"
  type        = list(string)
  default     = []
}

variable "mysql_cidr_blocks" {
  description = "CIDR blocks para permitir acceso a Mysql"
  type        = list(string)
  default     = []
}

variable "privateweb_cidr_blocks" {
  description = "CIDR blocks para permitir acceso Privado Web"
  type        = list(string)
  default     = []
}

variable "efs_cidr_blocks" {
  description = "CIDR blocks para permitir acceso a EFS"
  type        = list(string)
  default     = []
}

variable "common_tags" {
  description = "Common Tags"
  type        = map(string)
}