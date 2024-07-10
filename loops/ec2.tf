# resource <resource-type> <resource-name>

resource "aws_instance" "db" {
    # count = 3
    count = length(var.instance_names)
    ami = var.image_id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = var.instance_type
    tags = {
      Name = var.instance_names[count.index]
    }
}

resource "aws_security_group" "allow_ssh" {
  # ... other configuration ...
  name = var.sg_name
  description = var.sg_description

  tags = {
    Name = "allow_ssh"
    CreatedBy = "Narendra"
  }

  #this is block
  ingress {
    from_port        = var.ssh_port
    to_port          = var.ssh_port
    protocol         = var.protocall
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

