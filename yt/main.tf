provider "aws" {
  region = "us-east-1"
  access_key = "AKIAWZCVHHHQD22IBXFQ"
  secret_key = "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"
}

resource "aws_vpc" "vpc_my" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "vpc_my"
    }
}

resource "aws_subnet" "subnet-1" {
    vpc_id = aws_vpc.vpc_my.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "subnet-1"
        Subnet = "01"
    }
}
data "aws_vpc" "vpc_defaults" {
    default = true
}

resource "aws_subnet" "subnet-2" {
    vpc_id = data.aws_vpc.vpc_defaults.id
    cidr_block = "172.31.32.0/20"
    availability_zone = "us-east-1a"
    tags = {
        Name = "exi-defa-s-2"
    }
}

output "display-aws-vpc_my" {
  value = aws_vpc.vpc_my.id
}

