resource "aws_subnet" "sn_1" {
  vpc_id = var.vpc_id
  cidr_block = var.sn_cidr_block
  availability_zone = var.az
  tags = {
      Name = "${var.env}-sn_1"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = {
    Name = "${var.env}-igw"
  }
}

resource "aws_route_table" "rtb" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "${var.env}-rtb"
  }
}

