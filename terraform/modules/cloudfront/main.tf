resource "aws_cloudfront_distribution" "cdn" {
  enabled             = true
  is_ipv6_enabled     = true
  wait_for_deployment = true
  price_class         = var.price_class

  dynamic "origin" {
    for_each = { for origin in var.origins : origin.origin_id => origin }
    content {
      origin_id   = origin.value.origin_id
      domain_name = origin.value.domain_name

      custom_origin_config {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "https-only"
        origin_ssl_protocols   = ["TLSv1.2"]
      }
    }
  }

  default_cache_behavior {
    allowed_methods        = var.default_cache_behavior.allowed_methods
    cached_methods         = var.default_cache_behavior.cached_methods
    target_origin_id       = var.default_cache_behavior.target_origin_id
    viewer_protocol_policy = var.default_cache_behavior.viewer_protocol_policy
    compress               = true
    cache_policy_id        = aws_cloudfront_cache_policy.default_cache_policy.id
  }

  viewer_certificate {
    # acm_certificate_arn = var.acm_certificate_arn
    cloudfront_default_certificate = var.cloudfront_default_certificate
    # ssl_support_method = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
