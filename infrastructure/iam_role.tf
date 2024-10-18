/*
  aws_iam_role is a resource that creates an IAM role that can be assumed by the Lambda function.
  The role will be used to grant permissions to the Lambda function.
  The assume_role_policy attribute references the IAM policy document created by the aws_iam_policy_document data source.
  - name: The name of the IAM role.
  - assume_role_policy: The ARN of the IAM policy document that allows the Lambda function to assume the role.
*/
resource "aws_iam_role" "lambda_dedicated_infrastructure_role" {
  name               = "lambda-dedicated-infrastructure-func-role"
  assume_role_policy = data.aws_iam_policy_document.LambdaAWSLambdaTrustPolicy.json

  tags = {
    Name = "resource_dedicated_infrastructure"
    Project = "lambda_dedicated_infrastructure"
  }
}

/* Destroy */
