# Output variable definitions
output "ec2_web_cluster_ids" {
  description = "IDs de las instancias EC2 Web Frontend"
  value       = module.ec2_web_cluster.id
}

output "webapp_url" {
  description = "URL publica Web App Demo"
  value       = "http://${local.subdomain}.${var.domain}"
}