/*
  aws_iam_policy_document is a data source that generates an IAM policy document that can be referenced by other resources.
  This policy document will allow the Lambda function to assume the role and execute the function.
  - statement: The policy statement that allows the Lambda function to assume the role.
    - actions: The actions that the Lambda function is allowed to perform.
    - effect: The effect of the policy statement (Allow in this case).
    - principals: The entities that are allowed to assume the role.
      - type: The type of entity (Service in this case).
      - identifiers: The identifiers of the entity (lambda.amazonaws.com in this case).
*/

data "aws_iam_policy_document" "LambdaAWSLambdaTrustPolicy" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}