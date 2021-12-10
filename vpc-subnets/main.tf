provider "aws" { 
    region = "us-east-1"
}

 resource "aws_vpc" "vpc_created" {
  cidr_block = var.vpc_cidr_block
  tags = {
      Name = "${var.env}-vpc"
  }
} 

module "mod-subnet" {
    source = "./modules/subnet"
    sn_cidr_block = var.sn_cidr_block
    az = var.az
    env =var.env
    vpc_id = aws_vpc.vpc_created.id
}