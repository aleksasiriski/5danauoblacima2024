resource "aws_acm_certificate" "certificate" {
  # domain_name               = var.domain_name
  subject_alternative_names = var.subject_alternative_names
  # validation_method         = "DNS"

  key_algorithm = var.key_algorithm

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "certificate_validation" {
  certificate_arn         = aws_acm_certificate.certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.certficate_dns_challenge : record.fqdn]
}
