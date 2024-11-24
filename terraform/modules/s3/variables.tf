variable "bucket_name" {
  description = "The name of the bucket to create, the region and account ID will be appended to this name"
  type        = string
}

variable "bucket_name_suffix" {
  description = "Used to obfuscate the bucket name"
  type        = string
  default     = ""
  sensitive   = true
}
