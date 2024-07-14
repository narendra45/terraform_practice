data "aws_ami" "ami_id" {

    most_recent = true
    owners = [ "973714476881" ] # AMI Owner account ID
    filter {
      name = "name"
      values = [ "RHEL-9-Devops-Practice" ]

    }
    filter {
      name = "root-device-type"
      values = [ "ebs" ]

    }
    filter {
      name = "virtualization-type"
      values = [ "hvm" ]

    }

  
}


data "aws_vpc" "default" {
 default = true 
}