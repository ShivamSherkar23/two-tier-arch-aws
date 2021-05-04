output "webserver_sg_id" {
  value = aws_security_group.webserver_sg.id
}

output "database_sg_id" {
  value = aws_security_group.database_sg.id
}