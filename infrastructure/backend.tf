/**********************************************************
  # Configure S3 Backend
**********************************************************/

terraform {
  backend "s3" {
    bucket         = "lambda-dedicated-resource-927096366770"
    key            = "lambda-dedicated-resource-927096366770.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "lambda-dedicated-resource-927096366770"
  }
}
