#provider configuration.
	terraform{
		required_providers {
			aws = {
				source = "hashicorp/aws"
				version = "5.48.0"
			}
		}
	backend "s3" {
		bucket = "mybucket"
		key    = "ec2-module-test"
		region = "us-east-1"
		dynamodb_table = "<dynamodb nale>"
  }
	}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
