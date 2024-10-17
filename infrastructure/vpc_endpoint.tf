/**
 * Create a VPC endpoint for the monitoring service in the VPC
    - The VPC endpoint will be of type Interface
    - The VPC endpoint will be associated with the VPC
    - The VPC endpoint will be associated with the security group for the VPC endpoint
    - The VPC endpoint will be associated with the subnet
    - The VPC endpoint will have private DNS enabled
 */
resource "aws_vpc_endpoint" "demo_monitoring_vpc_endpoint" {
  vpc_id             = aws_vpc.demo_private_vpc.id
  service_name       = "com.amazonaws.eu-central-1.monitoring"
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.demo_monitoring_vpc_endpoint_sg.id]
  subnet_ids = [
    aws_subnet.demo_private_subnet.id
  ]
  private_dns_enabled = true

  policy = <<EOF
        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Principal": "*",
                    "Action": "cloudwatch:PutMetricData",
                    "Resource": "*"
                }
            ]
        }
    EOF

  tags = {
    Name = "irs_demo_monitoring_vpc_endpoint"
    Project = "irs_demo_vpc_endpoint"
  }
}

/*
 -- Small Test before the demo -- 20-09-2023 10.03 --
*/

/*
* Test change in vpc_endpoint 1
* Check changes in the VPC endpoint
* Another change check
*
*/
