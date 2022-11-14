data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["amazon"] # Canonical
}

output "image_id" {
    value = "${data.aws_ami.ubuntu.id}"
}



#web server instance
resource "aws_instance" "webserver" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.aws_key_name
  vpc_security_group_ids      = [var.webserver_sg_id]
  subnet_id                   = var.public_subnet_id
  associate_public_ip_address = true
  source_dest_check           = false
  user_data                   = <<-EOF
                #!/bin/bash
                sudo apt-get update -y && sudo apt upgrade -y
                sudo apt install mysql-client-core-8.0 -y
                EOF


  tags = {
    Name = "webserver"
  }
}

resource "aws_eip" "webserver-eip" {
  instance = aws_instance.webserver.id
  vpc      = true
}

#create the rds in the private subnets wih high availability
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "main"
  subnet_ids = [var.private_subnet1_id, var.private_subnet2_id]

  tags = {
    Name = "db_subnet_group"
  }
}

resource "aws_db_instance" "mysql_rds" {
  identifier             = "mysql-rds"
  allocated_storage      = var.allocated_storage
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.id
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.name
  username               = var.username
  password               = var.password
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  vpc_security_group_ids = [var.database_sg_id]
}
