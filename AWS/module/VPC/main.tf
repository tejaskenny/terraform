resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  # Add other VPC configurations as needed
}

resource "aws_subnet" "my_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "your-availability-zone"
  # Add other subnet configurations as needed
}
