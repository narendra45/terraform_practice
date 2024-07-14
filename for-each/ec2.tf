resource "aws_instance" "expence" {
    for_each = var.instance_names # each.key and each.value
    ami = data.aws_ami.ami_info.id
    vpc_security_group_ids = [aws_security_group.allow_ssh.id]
    instance_type = each.value
    tags = merge(
      var.common_tags,
      {
        Name = each.key
        Module = each.value
      }
    )
}