# resource <resource-type> <resource-name>

resource "aws_instance" "db" {
    ami = "ami-041e2ea9402c46c32" #devops-practice
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = "t3.micro"
    tags = {
    Name = "db"
    }
}

resource "aws_instance" "backend" {
    ami = "ami-041e2ea9402c46c32" #devops-practice
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = "t3.micro"
    tags = {
    Name = "backend"
    }
}

resource "aws_instance" "frontend" {
    ami = "ami-041e2ea9402c46c32" #devops-practice
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = "t3.micro"
    tags = {
    Name = "frontend"
    }
}

resource "aws_security_group" "allow_ssh" {
  # ... other configuration ...
  name = "allow_ssh"
  description = "Allowing ssh connection"

  tags = {
    Name = "allow_ssh"
    CreatedBy = "Narendra"
  }
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0 # allows all protocalls
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

