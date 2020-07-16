resource "aws_route53_zone" "blairnangle_dot_com" {
  name = "blairnangle.com"

  tags = {
    Name = "Hosted Zone for blairnangle.com"
  }
}

resource "aws_route53_record" "www_cname" {
  name = "www.blairnangle.com"
  type = "CNAME"
  zone_id = aws_route53_zone.blairnangle_dot_com.id
  records = [
    "blairnangle.com"
  ]
  ttl = 300
}

resource "aws_route53_record" "zoho_mx" {
  name = "blairnangle.com"
  type = "MX"
  zone_id = aws_route53_zone.blairnangle_dot_com.id
  records = [
    "10 mx.zoho.eu",
    "20 mx2.zoho.eu",
    "50 mx3.zoho.eu"
  ]
  ttl = 300
}

resource "aws_route53_record" "github_pages_alias" {
  name = ""
  type = "A"
  zone_id = aws_route53_zone.blairnangle_dot_com.id
  records = [
    "185.199.109.153",
    "185.199.108.153",
    "185.199.110.153",
    "185.199.111.153"
  ]
  ttl = 300
}

resource "aws_route53_record" "txt" {
  name = "blairnangle.com"
  type = "TXT"
  zone_id = aws_route53_zone.blairnangle_dot_com.id
  records = [
    "zoho-verification=${var.zoho_verification_code}",
    "keybase-site-verification=${var.keybase_verification_code}"
  ]
  ttl = 300
}
