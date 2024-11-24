locals {
  default_identifiers = ["lambda.amazonaws.com"]
  identifiers         = setunion(var.identifiers, local.default_identifiers)
}
