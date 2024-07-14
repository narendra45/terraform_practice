variable "instance_names" {
    type = map
    # default = {
    #     db-dev = "t3.small"
    #     backend-dev = "t3.micro"
    #     frontend-dev = "t3.micro"
    # }
  
}

variable "environment" {
  # default = "dev"
  
}

variable "common_tags" {
    type = map
    default = {
        Project = "expence"
        # Environment = "Dev"
        terraform = "true"

    }
}

# variable "image_id" {
#     type = string
#     default = "ami-041e2ea9402c46c32"
#     description = "RHEL-9 AMI ID"
  
# }

variable "zone_id" {
  default = aws_route53_zone.primary.zone_id
}

variable "domain_name" {
  default = "www.example.com"  
}