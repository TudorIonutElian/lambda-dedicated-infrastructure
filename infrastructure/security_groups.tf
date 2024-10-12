/* 
    - Create a security group for the Lambda function. 
    - This security group will be associated with the Lambda function
    - Will allow outbound traffic on port 443 to the VPC endpoint security group 
*/
resource "aws_security_group" "demo_lambda_sg" {
  name = "demo_lambda_sg"
  vpc_id = aws_vpc.demo_private_vpc.id

  tags = {
    Name = "irs_demo_lambda_sg"
    Project = "irs_demo_vpc_endpoint"
  }
}

/* 
    - Create a security group for the VPC endpoint. 
    - This security group will be associated with the VPC endpoint
    - Will allow inbound traffic on port 443 from the Lambda function security group 
*/
resource "aws_security_group" "demo_monitoring_vpc_endpoint_sg" {
  name = "demo_monitoring_vpc_endpoint_sg"
  vpc_id = aws_vpc.demo_private_vpc.id
  tags = {
    Name = "irs_demo_monitoring_vpc_endpoint_sg"
    Project = "irs_demo_vpc_endpoint"
  }
}