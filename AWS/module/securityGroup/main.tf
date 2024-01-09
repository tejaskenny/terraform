resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  # Other VPC configurations
}


resource "aws_security_group" "db_security_group" {
  name        = "db_security_group"
  description = "Security group for MySQL database"
  vpc_id      = aws_vpc.my_vpc.id

  # Define inbound and outbound rules as needed
}
