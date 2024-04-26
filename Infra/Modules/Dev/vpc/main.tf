resource "aws_vpc" "main" {
  cidr_block           = var.cidr_block
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_sub01" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = {
    Name = "${var.vpc_name}-public-sub01"
  }
}

resource "aws_subnet" "public_sub02" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.5.2.0/24"  # Define the CIDR block for the new public subnet
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1b" # Define the availability zone for the new public subnet

  tags = {
    Name = "${var.vpc_name}-public-sub02"
  }
}

resource "aws_subnet" "private_sub01" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr
  map_public_ip_on_launch = false
  availability_zone       = var.availability_zone

  tags = {
    Name = "${var.vpc_name}-private-sub01"
  }
}

resource "aws_subnet" "private_sub02" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.5.3.0/24"  # Define the CIDR block for the new private subnet
  map_public_ip_on_launch = false
  availability_zone       = "ap-south-1b"  # Define the availability zone for the new private subnet

  tags = {
    Name = "${var.vpc_name}-private-sub02"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route_table_association" "public_rt_association_01" {
  subnet_id      = aws_subnet.public_sub01.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_rt_association_02" {
  subnet_id      = aws_subnet.public_sub02.id
  route_table_id = aws_route_table.public_rt.id
}
