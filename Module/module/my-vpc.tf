provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "my-aws" {
  cidr_block = "${var.vpc-cidr}"
  #cidr_block = "${movar.vpc-cidr}
  enable_dns_hostnames = true
  tags = {
    Name= var.vpc-name
  }
}

# Public subnet setup
#-----------------------------------------------------------------------------------
resource "aws_subnet" "public" {
  count = "${length(var.azs)}"
  vpc_id = aws_vpc.my-aws.id
  map_public_ip_on_launch = true
  cidr_block ="${cidrsubnet(var.vpc-cidr,8,count.index+2)}"
  availability_zone = "${element(var.azs,count.index )}"
  tags = {
    Name = "${var.Subnet-public}-${count.index}"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.my-aws.id
  tags = {
    Name = "${var.IGW_tag}"
  }
}

resource "aws_route_table" "public_rout" {
  vpc_id = aws_vpc.my-aws.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = {
    #Name = "Personal-IGW_Jump"
    Name = "${var.Public_rout}"
  }
}
resource "aws_route_table_association" "Public-Server" {
  route_table_id = aws_route_table.public_rout.id
  count = length(aws_subnet.public)
  subnet_id = aws_subnet.public[count.index].id
  #subnet_id = aws_subnet.public.id
}

# Private  subnet setup
#-------------------------------------------------------------------------


resource "aws_subnet" "private" {
  count = "${length(var.azs)}"

  vpc_id = aws_vpc.my-aws.id
  #count = "${length(var.azs)}"
  cidr_block ="${cidrsubnet(var.vpc-cidr,8,count.index+5)}"
  map_public_ip_on_launch = false
  #cidr_block ="${cidrsubnet(var.vpc-cidr,8,count.index+length(var.azs))}"
  availability_zone = "${element(var.azs,count.index )}"
  tags = {
    Name = "${var.Subnet-private}-${count.index}"
  }
}

resource "aws_eip" "Nat_IP" {
  tags = {
    Name="private_Nat"
    Name="${var.EIP_NAT}"
  }
}

resource "aws_nat_gateway" "My_Nat" {

  allocation_id = "${aws_eip.Nat_IP.id}"
  subnet_id = "${aws_subnet.public[0].id}"
  tags = {
    #Name= "My-Nat"
    Name= "${var.NAT_tag}"
  }
}

resource "aws_route_table" "My_NAT" {
  vpc_id = aws_vpc.my-aws.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.My_Nat.id
  }
  tags = {
    Name = "NAT_Testing"
    Name ="${var.Private_rout}"
  }
}
resource "aws_route_table_association" "Private_NAT" {
  count = length(aws_subnet.private)
  route_table_id = aws_route_table.My_NAT.id
  #count = length(var.azs)
  subnet_id = aws_subnet.private[count.index].id
}