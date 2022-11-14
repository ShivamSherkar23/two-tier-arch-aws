#terraform configuration
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

#aws configuration
provider "aws" {
  region = var.aws_region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                 = "default"
}

#calling vpc module
module "my_vpc" {
  source     = "./modules/vpc"
  aws_region = var.aws_region
}

#calling security groups module
module "my_security_groups" {
  source         = "./modules/security-groups"
  aws_region     = var.aws_region
  vpc_id         = module.my_vpc.vpc_id
  vpc_cidr_block = module.my_vpc.vpc_cidr_block
}

module "my_instances" {
  source                      = "./modules/instances"
  aws_region                  = var.aws_region
  vpc_id                      = module.my_vpc.vpc_id
  webserver_sg_id             = module.my_security_groups.webserver_sg_id
  database_sg_id              = module.my_security_groups.database_sg_id
  public_subnet_id            = module.my_vpc.public_subnet_id
  private_subnet1_id          = module.my_vpc.private_subnet1_id
  private_subnet2_id          = module.my_vpc.private_subnet2_id
}
