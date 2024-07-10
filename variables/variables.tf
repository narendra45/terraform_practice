variable "image_id" {
    type = string
    default = "ami-041e2ea9402c46c32"
    description = "RHEL-9 AMI ID"
  
}

variable "instance_type" {
    type = string
    default = "t3.micro"
  
}

variable "tags" {
    default = {
        Project = "expence"
        Environment = "Dev"
        Module = "Db"
        Name = "Db"

    }
  
}

variable "sg_name" {
    default = "allow_ssh"
  
}

variable "sg_description" {
  default = "allowing port 22"
}


variable "ssh_port" {
  default = 22
}

variable "protocall" {
  default = "tcp"
}

variable "allowed_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
  }













