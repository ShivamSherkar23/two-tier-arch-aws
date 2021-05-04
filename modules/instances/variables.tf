variable "aws_key_name" {}

variable "ami_id" {
  default = "ami-042e8287309f5df03"
}

variable "rds_port" {
  description = "MySQL default port"
}

variable "associate_public_ip_address" {
  description = "associate public ip for the instance or not"
}

variable "allocated_storage" {}

variable "engine" {}

variable "engine_version" {}

variable "instance_class" {}

variable "identifier" {}

variable "name" {}

variable "username" {
  description = "database username"
  sensitive   = true
  type        = string
}
variable "password" {
  description = "database password"
  sensitive   = true
  type        = string
}
variable "aws_region" {}
variable "vpc_id" {}
variable "public_subnet_id" {}
variable "private_subnet1_id" {}
variable "private_subnet2_id" {}
variable "database_sg_id" {}
variable "webserver_sg_id" {}

