resource "aws_lambda_function" "function" {
  function_name = var.name
  handler       = var.handler
  runtime       = var.runtime
  role          = aws_iam_role.role.arn

  s3_bucket        = var.src_s3_bucket
  s3_key           = var.src_s3_key
  source_code_hash = var.src_hash

  architectures = [var.architecture]
  memory_size   = var.memory_size
  timeout       = var.timeout

  environment {
    variables = var.environment
  }
}
