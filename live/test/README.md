# TechTalk Nubilink - Techdata

## Acelerando el deploy de Infraestructura en AWS con Terraform

### Despliegue aplicacion demo

- Grupos de Seguridad (VPC)
    - Admin
    - Private Web
    - Public Web
- Cluster Web (EC2)
- Balanceador de carga (ALB)
- Servicio de Nombre de Dominio (Route53)
- Certificado https (ACM)

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
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2_web_cluster"></a> [ec2\_web\_cluster](#module\_ec2\_web\_cluster) | terraform-aws-modules/ec2-instance/aws | 2.19.0 |
| <a name="module_security_groups"></a> [security\_groups](#module\_security\_groups) | ../../modules/security_groups |  |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | 3.0.0 |

## Resources

| Name | Type |
|------|------|
| [aws_acm_certificate.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate) | resource |
| [aws_acm_certificate_validation.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/acm_certificate_validation) | resource |
| [aws_cloudwatch_dashboard.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_dashboard) | resource |
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.validation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [template_file.deploy_web_frontend](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Nombre de aplicacion Web / Subdominio | `string` | n/a | yes |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Common Tags | `map(string)` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | Nombre de dominio | `string` | n/a | yes |
| <a name="input_ec2_ami"></a> [ec2\_ami](#input\_ec2\_ami) | AMI base para instancias EC2 Web | `string` | `"ami-07a3e3eda401f8caa"` | no |
| <a name="input_ec2_count"></a> [ec2\_count](#input\_ec2\_count) | Cantidad de instancias para el Target Group | `number` | `1` | no |
| <a name="input_ec2_key"></a> [ec2\_key](#input\_ec2\_key) | EC2 Key pair | `string` | n/a | yes |
| <a name="input_ec2_type"></a> [ec2\_type](#input\_ec2\_type) | Tipo instancia EC2 | `string` | `"t4g.nano"` | no |
| <a name="input_my_public_ip"></a> [my\_public\_ip](#input\_my\_public\_ip) | Mi IP publica | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefijo según Ambiente: Prod, Desa, Test | `string` | n/a | yes |
| <a name="input_vpc_azs"></a> [vpc\_azs](#input\_vpc\_azs) | Zonas de disponibilidad para la VPC | `list(string)` | n/a | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | Bloque CIDR para la VPC | `string` | n/a | yes |
| <a name="input_vpc_database_subnet_tags"></a> [vpc\_database\_subnet\_tags](#input\_vpc\_database\_subnet\_tags) | Tags adicionales para aplicar a SubRedes de Base de Datos | `map(string)` | <pre>{<br>  "Subnet_type": "database"<br>}</pre> | no |
| <a name="input_vpc_database_subnets"></a> [vpc\_database\_subnets](#input\_vpc\_database\_subnets) | SubRedes de Base de Datos para la VPC | `list(string)` | n/a | yes |
| <a name="input_vpc_enable_nat_gateway"></a> [vpc\_enable\_nat\_gateway](#input\_vpc\_enable\_nat\_gateway) | Habilita Nat Gateway para la VPC | `bool` | `true` | no |
| <a name="input_vpc_enable_vpn_gateway"></a> [vpc\_enable\_vpn\_gateway](#input\_vpc\_enable\_vpn\_gateway) | Crear VPN Gateway | `bool` | `false` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Nombre de la VPC | `string` | n/a | yes |
| <a name="input_vpc_private_subnet_tags"></a> [vpc\_private\_subnet\_tags](#input\_vpc\_private\_subnet\_tags) | Tags adicionales para aplicar a SubRedes Privadas | `map(string)` | <pre>{<br>  "Subnet_type": "private"<br>}</pre> | no |
| <a name="input_vpc_private_subnets"></a> [vpc\_private\_subnets](#input\_vpc\_private\_subnets) | SubRedes privadas para la VPC | `list(string)` | n/a | yes |
| <a name="input_vpc_public_subnet_tags"></a> [vpc\_public\_subnet\_tags](#input\_vpc\_public\_subnet\_tags) | Tags adicionales para aplicar a SubRedes Públicas | `map(string)` | <pre>{<br>  "Subnet_type": "public"<br>}</pre> | no |
| <a name="input_vpc_public_subnets"></a> [vpc\_public\_subnets](#input\_vpc\_public\_subnets) | SubRedes públicas para la VPC | `list(string)` | n/a | yes |
| <a name="input_vpc_single_nat_gateways"></a> [vpc\_single\_nat\_gateways](#input\_vpc\_single\_nat\_gateways) | NAT Gateway único para la VPC | `bool` | `true` | no |
| <a name="input_vpc_tags"></a> [vpc\_tags](#input\_vpc\_tags) | Tags para aplicar a los recursos creados por el módulo de VPC | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_web_cluster_ids"></a> [ec2\_web\_cluster\_ids](#output\_ec2\_web\_cluster\_ids) | IDs de las instancias EC2 Web Frontend |
| <a name="output_webapp_url"></a> [webapp\_url](#output\_webapp\_url) | URL publica Web App Demo |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
