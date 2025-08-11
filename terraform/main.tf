#
# Main Terraform configuration file.
#
# This file defines the infrastructure resources to be provisioned.
# It is configured to work with a LocalStack environment.
#

# Configure the AWS provider to connect to LocalStack
provider "aws" {
  # Using mock credentials for LocalStack
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
  region                      = "us-east-1"

  # Configuration flags required to work with LocalStack
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  # Define the custom endpoint for the S3 service in LocalStack
  endpoints {
    s3             = "http://s3.localhost.localstack.cloud:4566"
  }
}

# Define an S3 bucket resource
resource "aws_s3_bucket" "test-bucket" {
  # The name of the S3 bucket
  bucket = "my-bucket"
}