# Output variable definitions
output "admin_access_sg" {
  description = "Nombre Security Group Admin_Access"
  value       = concat(aws_security_group.admin_access_sg.*.id, [""])[0]
}

output "posgres_access_sg" {
  description = "Nombre Security Group Posgres Access"
  value       = concat(aws_security_group.postgres_access_sg.*.id, [""])[0]
}

output "mysql_access_sg" {
  description = "Nombre Security Group Mysql Access"
  value       = concat(aws_security_group.mysql_access_sg.*.id, [""])[0]
}

output "publicweb_sg" {
  description = "Nombre Security Group Public Web"
  value       = aws_security_group.publicweb_sg.id
}

output "privateweb_sg" {
  description = "Nombre Security Group Private Web"
  value       = concat(aws_security_group.privateweb_sg.*.id, [""])[0]
}

output "efs_access_sg" {
  description = "Nombre Security Group EFS Access"
  value       = concat(aws_security_group.efs_access_sg.*.id, [""])[0]
}
