provider "aws" {
  region = "us-east-1"
}

variable "sn-cidr-block" {
   
    description = "subnet cidr block"
    default = "10.0.2.0/24"
    type = string
}

variable "cidr_blocks" {
  type = list(string)
}
variable "vpc-cidr-block" {
  description = "vpc cidr block"
  default = "10.0.0.0/16"
  type = string
}

variable "az" {
  
}
variable "env" {
  description = "env to deploy"
  default = "devlopement"
}
resource "aws_vpc" "vpc-created" {
    cidr_block = var.cidr_blocks[0]
    tags = {
        Name = var.env
    }
}

resource "aws_subnet" "subnet-1" {
    vpc_id = aws_vpc.vpc-created.id
    cidr_block = var.cidr_blocks[1]
    availability_zone = var.az
    tags = {
        Name = "subnet-1"
        Subnet = "01"
    }
}

output "display-aws-vpc-created" {
  value = aws_vpc.vpc-created.id
}

output "display-aws-sn-1" {
  value = aws_subnet.subnet-1.id
}



