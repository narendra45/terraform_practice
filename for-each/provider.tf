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
		key    = "expense-for-loop"
		region = "us-east-1"
		dynamodb_table = "<dynamodb name>"
  }
	}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
