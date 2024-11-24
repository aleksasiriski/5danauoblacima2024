variable "name" {
  description = "The name of the CloudFront distribution"
  type        = string
}

variable "price_class" {
  description = "The price class of the CloudFront distribution"
  type        = string
  default     = "PriceClass_100"
}

variable "cloudfront_default_certificate" {
  description = "The default CloudFront certificate"
  type        = bool
  default     = true
}

variable "origins" {
  description = "The origins of the CloudFront distribution"
  type = list(object({
    origin_id   = string
    domain_name = string
  }))

  validation {
    condition     = length(var.origins) > 0
    error_message = "At least one origin must be provided"
  }

  validation {
    condition     = length([for origin in var.origins : origin.origin_id]) == length(distinct([for origin in var.origins : origin.origin_id]))
    error_message = "Origin IDs must be unique"
  }
}

variable "origin_request_header_behavior" {
  description = "The header behavior for the CloudFront distribution origin requests"
  type        = string
  default     = "whitelist"
}

variable "origin_request_header_items" {
  description = "The header items for the CloudFront distribution origin requests"
  type        = set(string)
  default = [
    "Accept",
    "Accept-Language",
    "Access-Control-Request-Headers",
    "Access-Control-Request-Method",
    "Origin",
  ]
}

variable "additional_origin_request_header_items" {
  description = "The header items for the CloudFront distribution origin requests"
  type        = set(string)
  default     = []
}

variable "cache_header_behavior" {
  description = "The header behavior for the CloudFront distribution cache requests"
  type        = string
  default     = "whitelist"
}

variable "cache_header_items" {
  description = "The header items for the CloudFront distribution cache requests"
  type        = set(string)
  default = [
    "Accept",
    "Accept-Language",
    "Access-Control-Request-Headers",
    "Access-Control-Request-Method",
    "Origin",
  ]
}

variable "additional_cache_header_items" {
  description = "Additional header items for the CloudFront distribution cache requests"
  type        = set(string)
  default     = []
}

variable "default_cache_behavior" {
  description = "The default cache behavior of the CloudFront distribution"
  type = object({
    allowed_methods        = optional(set(string), ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"])
    cached_methods         = optional(set(string), []) // Usually you want ["GET", "HEAD"], [] means no caching
    target_origin_id       = string
    viewer_protocol_policy = optional(string, "redirect-to-https")

    cache_policy = object({
      min_ttl     = optional(number, 3600)  // 1 hour
      default_ttl = optional(number, 3600)  // 1 hour
      max_ttl     = optional(number, 86400) // 1 day
    })
  })
}
