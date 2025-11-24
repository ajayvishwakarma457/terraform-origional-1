# --------------------------
# Hosted Zone
# --------------------------
resource "aws_route53_zone" "this" {
  name = var.domain_name

  tags = merge(var.common_tags, {
    Name = "${var.project_name}-hosted-zone"
  })
}

# --------------------------
# A Records
# --------------------------
resource "aws_route53_record" "a_records" {
  count   = length(var.a_records)
  zone_id = aws_route53_zone.this.zone_id
  name    = var.a_records[count.index].name
  type    = "A"
  ttl     = var.a_records[count.index].ttl
  records = var.a_records[count.index].records
}

# --------------------------
# CNAME Records
# --------------------------
resource "aws_route53_record" "cname_records" {
  count   = length(var.cname_records)
  zone_id = aws_route53_zone.this.zone_id
  name    = var.cname_records[count.index].name
  type    = "CNAME"
  ttl     = var.cname_records[count.index].ttl
  records = [var.cname_records[count.index].value]
}

# --------------------------
# TXT Records
# --------------------------
resource "aws_route53_record" "txt_records" {
  count   = length(var.txt_records)
  zone_id = aws_route53_zone.this.zone_id
  name    = var.txt_records[count.index].name
  type    = "TXT"
  ttl     = var.txt_records[count.index].ttl
  records = var.txt_records[count.index].records
}

# --------------------------
# MX Records
# --------------------------
resource "aws_route53_record" "mx_records" {
  count   = length(var.mx_records)
  zone_id = aws_route53_zone.this.zone_id
  name    = var.mx_records[count.index].name
  type    = "MX"
  ttl     = var.mx_records[count.index].ttl
  records = var.mx_records[count.index].records
}
