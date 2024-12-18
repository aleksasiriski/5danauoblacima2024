data "aws_iam_policy_document" "policy_document_execute" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = local.identifiers
    }
  }
}

data "aws_iam_policy_document" "policy_document_logging" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = ["arn:aws:logs:*:*:*"]
  }
}

resource "aws_iam_role" "role" {
  name               = "${var.name}-role"
  assume_role_policy = data.aws_iam_policy_document.policy_document_execute.json
}

resource "aws_iam_policy" "policy_logging" {
  name        = "${var.name}-logging-policy"
  path        = "/"
  description = "IAM policy for logging by Lambda"
  policy      = data.aws_iam_policy_document.policy_document_logging.json
}

resource "aws_iam_role_policy_attachment" "policy_attachment_logging" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy_logging.arn
}

resource "aws_iam_role_policy_attachment" "policy_attachment_dynamodb" {
  count = var.dynamodb_policy_arn != null ? 1 : 0

  role       = aws_iam_role.role.name
  policy_arn = var.dynamodb_policy_arn
}

resource "aws_iam_role_policy_attachment" "policy_attachment_s3" {
  count = var.s3_policy_arn != null ? 1 : 0

  role       = aws_iam_role.role.name
  policy_arn = var.s3_policy_arn
}
