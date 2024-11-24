# resource "aws_cloudfront_origin_request_policy" "default_origin_request_policy" {
#   name = "${var.name}-default-origin-request-policy"

#   cookies_config {
#     cookie_behavior = "none"
#   }

#   headers_config {
#     header_behavior = var.origin_request_header_behavior
#     headers {
#       items = local.origin_request_header_items
#     }
#   }

#   query_strings_config {
#     query_string_behavior = "all"
#   }
# }

resource "aws_cloudfront_cache_policy" "default_cache_policy" {
  name        = "${var.name}-default-cache-policy"
  min_ttl     = var.default_cache_behavior.cache_policy.min_ttl
  default_ttl = var.default_cache_behavior.cache_policy.default_ttl
  max_ttl     = var.default_cache_behavior.cache_policy.max_ttl

  parameters_in_cache_key_and_forwarded_to_origin {
    enable_accept_encoding_brotli = true
    enable_accept_encoding_gzip   = true

    cookies_config {
      cookie_behavior = "none"
    }

    headers_config {
      header_behavior = var.cache_header_behavior
      headers {
        items = local.cache_header_items
      }
    }

    query_strings_config {
      query_string_behavior = "all"
    }
  }
}
