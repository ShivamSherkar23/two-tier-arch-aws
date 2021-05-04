#vpc setup
resource "aws_vpc" "new_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "new_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private_subnet1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1d"

  tags = {
    Name = "private_subnet2"
  }
}

resource "aws_internet_gateway" "new_igw" {
  vpc_id = aws_vpc.new_vpc.id

  tags = {
    Name = "new_igw"
  }
}

resource "aws_eip" "new_nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.new_igw]
  tags = {
    Name = "new_nat_eip"
  }
}

resource "aws_nat_gateway" "new_nat" {
  allocation_id = aws_eip.new_nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id

  tags = {
    Name = "new_nat"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.new_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.new_igw.id
  }

  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt1" {
  vpc_id = aws_vpc.new_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.new_nat.id
  }

  tags = {
    Name = "private_rt1"
  }
}

resource "aws_route_table" "private_rt2" {
  vpc_id = aws_vpc.new_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.new_nat.id
  }

  tags = {
    Name = "private_rt2"
  }
}

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.private_rt1.id
}

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.private_rt2.id
}