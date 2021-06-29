# TechTalk Nubilink - Techdata

## Acelerando el deploy de Infraestructura en AWS con Terraform

### Creación de Grupos de Seguridad standard

Incluye

- AdminAccess_SG: Grupo de Seguridad para acceso SSH y/o RDP a las instancias EC2
- PostgresAccess_SG: Para acceso a bases de datos Postgres (EC2 o RDS)
- MysqlAccess_SG: Para acceso a bases de datos Mysql (EC2 o RDS)
- PublicWeb_SG: Acceso HTTP y HTTPs público
- PrivateWeb_SG: Acceso HTTP y HTTPs privado
- EFS_Access_SG: Acceso a EFS

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.4, < 0.16 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.68, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.68, < 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.admin_access_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.efs_access_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.mysql_access_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.postgres_access_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.privateweb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.publicweb_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_cidr_blocks"></a> [admin\_cidr\_blocks](#input\_admin\_cidr\_blocks) | CIDR blocks para permitir acceso Administrativo | `list(string)` | `[]` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common Tags | `map(string)` | n/a | yes |
| <a name="input_efs_cidr_blocks"></a> [efs\_cidr\_blocks](#input\_efs\_cidr\_blocks) | CIDR blocks para permitir acceso a EFS | `list(string)` | `[]` | no |
| <a name="input_mysql_cidr_blocks"></a> [mysql\_cidr\_blocks](#input\_mysql\_cidr\_blocks) | CIDR blocks para permitir acceso a Mysql | `list(string)` | `[]` | no |
| <a name="input_postgres_cidr_blocks"></a> [postgres\_cidr\_blocks](#input\_postgres\_cidr\_blocks) | CIDR blocks para permitir acceso a Postgres | `list(string)` | `[]` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefijo según Ambiente: Prod, Desa, Test | `string` | n/a | yes |
| <a name="input_privateweb_cidr_blocks"></a> [privateweb\_cidr\_blocks](#input\_privateweb\_cidr\_blocks) | CIDR blocks para permitir acceso Privado Web | `list(string)` | `[]` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_admin_access_sg"></a> [admin\_access\_sg](#output\_admin\_access\_sg) | Nombre Security Group Admin\_Access |
| <a name="output_efs_access_sg"></a> [efs\_access\_sg](#output\_efs\_access\_sg) | Nombre Security Group EFS Access |
| <a name="output_mysql_access_sg"></a> [mysql\_access\_sg](#output\_mysql\_access\_sg) | Nombre Security Group Mysql Access |
| <a name="output_posgres_access_sg"></a> [posgres\_access\_sg](#output\_posgres\_access\_sg) | Nombre Security Group Posgres Access |
| <a name="output_privateweb_sg"></a> [privateweb\_sg](#output\_privateweb\_sg) | Nombre Security Group Private Web |
| <a name="output_publicweb_sg"></a> [publicweb\_sg](#output\_publicweb\_sg) | Nombre Security Group Public Web |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->