output "vpc_id" {
  value = aws_vpc.new_vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.new_vpc.cidr_block
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet1_id" {
  value = aws_subnet.private_subnet1.id
}

output "private_subnet2_id" {
  value = aws_subnet.private_subnet2.id
}

