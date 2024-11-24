variable "subject_alternative_names" {
  description = "A list of additional domain names to be included in the Subject Alternative Name extension of the ACM certificate"
  type        = set(string)
  default     = []
}

variable "key_algorithm" {
  description = "The algorithm that will be used to generate the key pair of the certificate"
  type        = string
  default     = "EC_prime256v1"
}
