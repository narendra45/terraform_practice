resource "aws_route53_record" "expence" {
  count = length(var.instance_names)
  zone_id = var.zone_id
  name    = var.instance_names[count.index] == "frontend" ? var.domain_name : "${var.var.instance_names[count.index]}.${var.domain_name}"
  # name    = local.record_name
  type    = "A"
  ttl     = 1
  # records = local.record_value
  records = var.instance_names[count.index] == "frontend" ? [aws_instance.expence[count.index].public_ip] : [aws_instance.expence[count.index].private_ip]

  # if records already exists
  allow_overwrite = true
}