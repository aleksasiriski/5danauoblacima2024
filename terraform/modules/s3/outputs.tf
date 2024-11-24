output "bucket_id" {
  value = aws_s3_bucket.bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "name" {
  value = local.bucket_name // TODO
}

output "lambda_access_policy_arn" {
  value = aws_iam_policy.s3_policy.arn
}
