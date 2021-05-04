provider "aws" {
  region = var.aws_region
}

module "my_vpc" {
  source     = "./modules/vpc"
  aws_region = var.aws_region
}

module "my_security_groups" {
  source         = "./modules/security-groups"
  vpc_id         = module.my_vpc.vpc_id
  aws_region     = var.aws_region
  vpc_cidr_block = module.my_vpc.vpc_cidr_block
}

module "my_instances" {
  source                      = "./modules/instances"
  vpc_id                      = module.my_vpc.vpc_id
  aws_region                  = var.aws_region
  webserver_sg_id             = module.my_security_groups.webserver_sg_id
  database_sg_id              = module.my_security_groups.database_sg_id
  public_subnet_id            = module.my_vpc.public_subnet_id
  private_subnet1_id          = module.my_vpc.private_subnet1_id
  private_subnet2_id          = module.my_vpc.private_subnet2_id
  aws_key_name                = var.aws_key_name
  ami_id                      = var.ami_id
  associate_public_ip_address = var.associate_public_ip_address
  allocated_storage           = var.allocated_storage
  engine                      = var.engine
  identifier                  = var.identifier
  name                        = var.identifier
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  username                    = var.username
  password                    = var.password
  rds_port                    = var.rds_port
}