#security group for instance
resource "aws_security_group" "webserver_sg" {
  name        = "webserver-sg"
  description = "Ingress for webserver"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.webserver_sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  dynamic "egress" {
    for_each = var.webserver_sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

#security group for rds
resource "aws_security_group" "database_sg" {
  name        = "database-sg"
  description = "Ingress for database"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.db_sg_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = [var.vpc_cidr_block]
    }
  }

  dynamic "egress" {
    for_each = var.db_sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
