<<<<<<< HEAD
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name    = "www.example.com"
  type    = "A"
  ttl     = 300
  records = [aws_eip.lb.public_ip]
=======
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
>>>>>>> 639444ef31f11529039b7c9434bb1ed6264286a6
}