
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
  filename         = data.archive_file.lambda_push_metrics_vpc_endpoint_func_archive.output_path
  source_code_hash = data.archive_file.lambda_push_metrics_vpc_endpoint_func_archive.output_base64sha256
  function_name    = "lambda_push_metrics_vpc_endpoint_func"
  role             = aws_iam_role.lambda_push_metrics_vpc_endpoint_func_role.arn
  handler          = "index.handler"
  runtime          = "nodejs14.x"
  depends_on       = [data.archive_file.lambda_push_metrics_vpc_endpoint_func_archive]
}