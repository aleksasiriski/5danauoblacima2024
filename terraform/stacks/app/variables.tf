variable "aws_region" {
  description = "AWS region"
  type        = string
  nullable    = false
  default     = "eu-central-1"
}

variable "aws_profile" {
  description = "AWS profile"
  type        = string
  nullable    = false
  default     = "982081080967_AWSAdministratorAccess"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  nullable    = false
  default     = "counter-strike"
}

variable "source_code_path" {
  description = "Path to the source code"
  type        = string
  nullable    = false
  default     = "../../../dist"
}
