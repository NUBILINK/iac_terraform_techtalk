# Terraform configuration
resource "aws_security_group" "admin_access_sg" {
  count = (length(var.admin_cidr_blocks) > 0) ? 1 : 0

  name        = "${lower(var.prefix)}-admin_access_sg"
  description = "Permite acceso SSH Administrativo"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.admin_cidr_blocks
  }

  ingress {
    description = "ICMP"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.admin_cidr_blocks
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    #tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = "${var.prefix}-AdminAccess_SG"
    },
    var.common_tags
  )
}

resource "aws_security_group" "postgres_access_sg" {
  count = (length(var.postgres_cidr_blocks) > 0) ? 1 : 0

  name        = "${lower(var.prefix)}-postgres_access_sg"
  description = "Permite acceso Postgres"
  vpc_id      = var.vpc_id

  ingress {
    description = "Postgres"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = var.postgres_cidr_blocks
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    #tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = "${var.prefix}-PostgresAccess_SG"
    },
    var.common_tags
  )
}

resource "aws_security_group" "mysql_access_sg" {
  count = (length(var.mysql_cidr_blocks) > 0) ? 1 : 0

  name        = "${lower(var.prefix)}-mysql_access_sg"
  description = "Permite acceso Mysql"
  vpc_id      = var.vpc_id

  ingress {
    description = "Mysql"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.mysql_cidr_blocks
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    #tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = "${var.prefix}-MysqlAccess_SG"
    },
    var.common_tags
  )
}

resource "aws_security_group" "publicweb_sg" {
  name        = "${lower(var.prefix)}-publicweb_sg"
  description = "Permite acceso HTTP y HTTPs"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from All"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPs from All"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    #tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = "${var.prefix}-PublicWeb_SG"
    },
    var.common_tags
  )
}

resource "aws_security_group" "privateweb_sg" {
  count = (length(var.privateweb_cidr_blocks) > 0) ? 1 : 0

  name        = "${lower(var.prefix)}-privateweb_sg"
  description = "Permite acceso HTTP y HTTPs solo dentro de la VPC y VPN"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.privateweb_cidr_blocks
  }

  ingress {
    description = "HTTPs"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = var.privateweb_cidr_blocks
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    #tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = "${var.prefix}-PrivateWeb_SG"
    },
    var.common_tags
  )
}

resource "aws_security_group" "efs_access_sg" {
  count = (length(var.efs_cidr_blocks) > 0) ? 1 : 0

  name        = "${lower(var.prefix)}-efs_access_sg"
  description = "Permite acceso a EFS"
  vpc_id      = var.vpc_id

  ingress {
    description = "Acceso via NFS"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = var.efs_cidr_blocks
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    #tfsec:ignore:AWS009
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      Name = "${var.prefix}-EFS_Access_SG"
    },
    var.common_tags
  )
}

