variable "aws_region" {
  default = "us-east-1"
}

variable "aws_key_name" {
  default = "shivamkp"
}

variable "ami_id" {
  default = "ami-042e8287309f5df03"
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
  default     = "database2"
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
  default     = "database2"
  description = "database identifier name"
}

variable "rds_port" {
  default     = 3306
  description = "port required by the sql engine"
}

variable "engine_version" {
  default = "5.7"
}

