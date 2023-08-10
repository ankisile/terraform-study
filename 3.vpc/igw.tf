resource "aws_internet_gateway" "igw-vpc-10-0-0-0" {
  vpc_id = aws_vpc.vpc-10-0-0-0.id

  tags = {
    Name = "igw-vpc-10-0-0-0"
  }
}