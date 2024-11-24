variable "name" {
  description = "The name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "The entry point of the Lambda function"
  type        = string
}

variable "runtime" {
  description = "The runtime of the Lambda function"
  type        = string
}

variable "src_s3_bucket" {
  description = "The S3 bucket where the Lambda function code is stored"
  type        = string
}

variable "src_s3_key" {
  description = "The S3 key where the Lambda function code is stored"
  type        = string
}

variable "src_hash" {
  description = "The hash of the Lambda function code"
  type        = string
}

variable "architecture" {
  description = "The architecture of the Lambda function"
  type        = string
  default     = "x86_64"
}

variable "memory_size" {
  description = "The memory size of the Lambda function"
  type        = number
  default     = 1769
}

variable "timeout" {
  description = "The timeout of the Lambda function"
  type        = number
  default     = 10
}

variable "environment" {
  description = "The environment variables of the Lambda function, ignored for Lambda@Edge"
  type        = map(string)
  default     = {}
  sensitive   = true
}

variable "keep_warm" {
  description = "Whether to keep the Lambda function warm by invoking it every 5 minutes"
  type        = bool
  default     = false
}

variable "identifiers" {
  description = "List of identifiers to attach to the role"
  type        = set(string)
  default     = []
}

variable "dynamodb_policy" {
  description = "Whether to attach a DynamoDB policy to the role"
  type        = bool
  default     = false
}

variable "dynamodb_policy_arn" {
  description = "ARN of the DynamoDB policy to attach to the role"
  type        = string
  default     = null
}

variable "s3_policy" {
  description = "Whether to attach a S3 policy to the role"
  type        = bool
  default     = false
}

variable "s3_policy_arn" {
  description = "ARN of the S3 policy to attach to the role"
  type        = string
  default     = null
}
