resource "aws_subnet" "demo_private_subnet" {
  vpc_id                  = aws_vpc.demo_private_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = false

  tags = {
    Name = "resource_dedicated_infrastructure"
    Project = "lambda_dedicated_infrastructure"
  }
}