variable "vpc_id" {}
variable "aws_region" {}
variable "vpc_cidr_block" {}
variable "webserver_sg_ports" {
  type        = list(number)
  description = "list of ingress ports for webserver"
  default     = [80, 443, 3306, 22]
}

variable "db_sg_ports" {
  type        = list(number)
  description = "list of ingress ports for db"
  default     = [3306, 22]
}