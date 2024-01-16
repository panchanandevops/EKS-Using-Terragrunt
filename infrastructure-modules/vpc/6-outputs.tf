# Terraform Outputs

# VPC ID Output
output "vpc_id" {
  value = aws_vpc.this.id  # Output the ID of the created VPC
}

# Private Subnet IDs Output
output "private_subnet_ids" {
  value = aws_subnet.private[*].id  # Output the IDs of the created private subnets
}

# Public Subnet IDs Output
output "public_subnet_ids" {
  value = aws_subnet.public[*].id  # Output the IDs of the created public subnets
}
