#provider configuration.
	terraform{
		required_providers {
			aws = {
				source = "hashicorp/aws"
				version = "5.48.0"
			}
		}
	}
# prrovide authentication.	
provider "aws" {
	region = "us-east-1"
}