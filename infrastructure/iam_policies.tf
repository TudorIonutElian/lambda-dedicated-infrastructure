
resource "aws_iam_policy" "demo_lambda_put_metric_policy" {
  name        = "LambdaPutMetricPolicy"
  description = "Policy to allow Lambda to put custom metrics to CloudWatch"
  policy      = data.aws_iam_policy_document.demo_lambda_put_metric_policy_doc.json
}

resource "aws_iam_policy" "demo_lambda_create_network_interface_policy" {
  name        = "LambdaCreateNetworkInterfacePolicy"
  description = "Policy to allow Lambda to create network interfaces"
  policy      = data.aws_iam_policy_document.demo_lambda_create_network_interface_policy_doc.json
}
