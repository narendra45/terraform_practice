locals {
  record_name = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.var.instance_names[count.index]}.${var.domain_name}"
  record_value = var.instance_names[count.index] == "frontend" ? [aws_instance.expence[count.index].public_ip] : [aws_instance.expence[count.index].private_ip]
}