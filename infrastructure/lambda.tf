
/* 
  This file contains the configuration for the AWS Lambda function that will be invoked by the CloudWatch Event Rule.
  The Lambda function will be triggered by the CloudWatch Event Rule every 5 minutes. See aws_cloudwatch_event_rule.lambda_timely_invoked_schedule
  - filename: The path to the .zip file containing the Lambda function code.
  - function_name: The name of the Lambda function.
  - role: The ARN of the IAM role that the Lambda function will assume.
  - handler: The name of the handler function in the Lambda code.
  - runtime: The runtime environment for the Lambda function.
  - source_code_hash: The base64-encoded SHA-256 hash of the .zip file containing the Lambda function code.
  - vpc_config: The VPC configuration for the Lambda function.
    - security_group_ids: The security group IDs for the Lambda function.
    - subnet_ids: The subnet IDs for the Lambda function.
*/
resource "aws_lambda_function" "lambda_push_metrics_vpc_endpoint_func" {
  filename         = "lambda_push_metrics_vpc_endpoint_func.zip"
  function_name    = "lambda-push-metrics-vpc-endpoint-func"
  role             = aws_iam_role.lambda_push_metrics_vpc_endpoint_func_role.arn
  handler          = "index.handler"
  runtime          = "nodejs20.x"

  vpc_config {
    security_group_ids = [aws_security_group.demo_lambda_sg.id]
    subnet_ids         = [aws_subnet.demo_private_subnet.id]
  }

  tags = {
    Name = "irs_lambda_push_metrics_vpc_endpoint_func"
    Project = "irs_demo_vpc_endpoint"
  }
}