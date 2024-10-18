
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
resource "aws_lambda_function" "lambda_dedicated_infrastructure" {
  filename         = data.archive_file.lambda_dedicated_infrastructure_archive.output_path
  source_code_hash = data.archive_file.lambda_dedicated_infrastructure_archive.output_base64sha256
  function_name    = "lambda-dedicated-infrastructure-func"
  role             = aws_iam_role.lambda_dedicated_infrastructure_role.arn
  handler          = "index.handler"
  runtime          = "nodejs20.x"
  depends_on       = [data.archive_file.lambda_dedicated_infrastructure_archive]

  tags = {
    Name = "resource_dedicated_infrastructure"
    Project = "lambda_dedicated_infrastructure"
  }
}

resource "aws_lambda_permission" "allow_sns_invoke" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.lambda_dedicated_infrastructure.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.lambda_dedicated_infrastructure_topic.arn
}