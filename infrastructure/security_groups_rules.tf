/* 
    - Create an outbound rule for the Lambda function security group. 
    - This rule will allow outbound traffic on port 443 to the VPC endpoint security group 
*/
resource "aws_security_group_rule" "demo_lambda_sg_outbound_rule" {
  type                     = "egress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_lambda_sg.id
  source_security_group_id = aws_security_group.demo_monitoring_vpc_endpoint_sg.id
}

/* 
    - Create an inbound rule for the VPC endpoint security group. 
    - This rule will allow inbound traffic on port 443 from the Lambda function security group 
*/
resource "aws_security_group_rule" "demo_monitoring_vpc_endpoint_sg_inbound_rule" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.demo_monitoring_vpc_endpoint_sg.id
  source_security_group_id = aws_security_group.demo_lambda_sg.id
}