#provider configuration.
	terraform{
		required_providers {
			aws = {
				source = "hashicorp/aws"
				version = "5.48.0"
			}
		}
	backend "s3" {
		bucket = "expence-remote-state"
		key    = "expence-dev-sg"
		region = "us-east-1"
		dynamodb_table = "expence-locking"
  }
	}
# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}
