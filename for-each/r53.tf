resource "aws_route53_record" "expence" {
  for_each = aws_instance.expence
  count = length(var.instance_names)
  zone_id = var.zone_id
  name    = each.hey == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  # name    = local.record_name
  type    = "A"
  ttl     = 1
  # records = local.record_value
  records = eack.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]

  # if records already exists
  allow_overwrite = true
}