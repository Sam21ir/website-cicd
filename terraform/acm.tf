# acm.tf

resource "aws_acm_certificate" "website_certificate" {
  provider             = aws.us_east_1
  domain_name          = "www.silas-teixeira.com"
  validation_method    = "DNS"
  subject_alternative_names = ["silas-teixeira.com"]

  lifecycle {
    create_before_destroy = true
  }

  options {
    certificate_transparency_logging_preference = "ENABLED"
  }
}

resource "aws_acm_certificate_validation" "website_certificate_validation" {
  provider           = aws.us_east_1
  certificate_arn    = aws_acm_certificate.website_certificate.arn

  validation_record_fqdns = [
    for record in aws_route53_record.acm_cert_validation : record.fqdn
  ]
}
