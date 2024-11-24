locals {
  origin_request_header_items = setunion(var.origin_request_header_items, var.additional_origin_request_header_items)
  cache_header_items          = setunion(var.cache_header_items, var.additional_cache_header_items)
}
