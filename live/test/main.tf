#############
# Main config
provider "aws" {
  profile = "aws-cli-profile"
  region  = "us-east-2"
}

########
# Locals 
locals {
  subdomain = (lower(var.prefix) != "prod" ? "${lower(var.prefix)}-${lower(var.application)}" : lower(var.application))
}