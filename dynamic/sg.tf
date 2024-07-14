resource "aws_security_group" "allow_ports" {

    name = "allow_ports"
    description = "allowing 22,80,8080,3306 access"
    tags = {
    Name = "allow_ssh"
    CreatedBy = "Narendra"
  }

  #this is block
  dynamic "ingress" {
    for_each = var.inboud_rule
    content {
      from_port        = ingress.vlue["port"]
      to_port          = ingress.vlue["port"]
      protocol         = ingress.vlue["protocol"]
      cidr_blocks      = ingress.vlue["allowed_cidr"]
    }
    
  } 

  egress {
    from_port        = 0 # allows all protocalls
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
