data "aws_iam_policy_document" "s3_policy_document" {
  statement {
    effect = "Allow"
    actions = [
        "s3:*", // TODO: Restrict this
      "s3:PutObject",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:ListBucket"
    ]
    resources = [
      "arn:aws:s3:::${local.bucket_name}",
      "arn:aws:s3:::${local.bucket_name}/*"
    ]
  }
}

resource "aws_iam_policy" "s3_policy" {
  name        = "${replace(var.bucket_name, "-", "_")}_s3_access_policy"
  description = "Policy to allow Lambda to access the S3 bucket"
  policy      = data.aws_iam_policy_document.s3_policy_document.json
}
