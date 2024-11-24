output "dynamodb_table_name" {
  value = aws_dynamodb_table.table.name
}

output "lambda_access_policy_arn" {
  value = aws_iam_policy.dynamodb_policy.arn
}
