resource "aws_instance" "db" {
  ami = "ami_id"
  vpc_security_group_ids = [ "" ]
  instance_type = lookup(var.instance_type,terraform.workspace)


  tags = {
    Name = "db"
  }
}