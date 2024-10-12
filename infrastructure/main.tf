/**********************************************************
  # Configure the AWS Provider
  # Add configuration to authorisation keys
  # Configure the AWS Provider
   - required_providers: The required providers for this configuration.
    - source: The source of the provider (hashicorp/aws).
    - version: The version of the provider to use (~> 5.0).
*********************************************************/
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

/**********************************************************
  # Add configuration to authorisation keys
  # Configure the AWS Provider  
  - shared_config_files: The path to the shared AWS configuration file.
  - shared_credentials_files: The path to the shared AWS credentials file.
  - profile: The name of the AWS profile to use for authentication.
**********************************************************/

provider "aws" {
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
}