variable "aws_key_name" {
  default = "hp-keypair"
}

variable "associate_public_ip_address" {
  default     = true
  description = ""
}

variable "allocated_storage" {
  default     = 5
  description = "database storage in GB"
}

variable "engine" {
  default     = "mysql"
  description = "database engine for the RDS"
}

variable "name" {
  default     = "mysql_rds"
  description = "database name"
}

variable "instance_class" {
  default     = "db.t2.micro"
  description = "database instance type"
}

variable "username" {
  default     = "admin"
  description = "database username"
}

variable "password" {
  default     = "password"
  description = "database password"
}

variable "identifier" {
  default     = "mysql_rds"
  description = "database identifier name"
}

variable "rds_port" {
  default     = 3306
  description = "port required by the sql engine"
}

variable "engine_version" {
  default = "5.7"
}

variable "instance_type" {
  default = "t2.micro"
}


variable "aws_region" {}
variable "vpc_id" {}
variable "public_subnet_id" {}
variable "private_subnet1_id" {}
variable "private_subnet2_id" {}
variable "database_sg_id" {}
variable "webserver_sg_id" {}

