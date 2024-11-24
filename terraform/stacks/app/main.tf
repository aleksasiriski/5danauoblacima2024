data "aws_region" "current" {}

module "cloudfront_cdn" {
  source = "../../modules/cloudfront"

  name = "${var.project_name}-cdn"

  origins = [
    {
      origin_id   = "apigateway"
      domain_name = module.apigateway.api_endpoint
    }
  ]

  default_cache_behavior = {
    target_origin_id = "apigateway"
  }
}

module "apigateway" {
  source = "../../modules/apigateway"

  name          = "${var.project_name}-api-gateway"
  function_name = module.lambda.function_name
  invoke_arn    = module.lambda.invoke_arn
  routes        = var.routes
}

module "lambda" {
  source = "../../modules/lambda"

  name    = "${var.project_name}-lambda"
  runtime = "nodejs20.x"
  handler = "lambda.handler"

  src_s3_bucket = module.s3_src_upload.bucket_id
  src_s3_key    = module.s3_src_upload.s3_key
  src_hash      = module.s3_src_upload.source_code_hash

  dynamodb_policy_arn = module.database.lambda_access_policy_arn
  s3_policy_arn       = module.s3_matches.lambda_access_policy_arn

  environment = {
    S3_BUCKET : module.s3_matches.name
    DYNAMODB_REGION : data.aws_region.current.name
    DYNAMODB_TABLE : module.database.dynamodb_table_name
  }
}

module "s3_src_upload" {
  source = "../../modules/s3-src-upload"

  bucket_name          = "${var.project_name}-src"
  filename             = module.source_code_archive.filename
  content_base64       = module.source_code_archive.output_base64
  content_base64sha256 = module.source_code_archive.output_base64sha256
}

module "source_code_archive" {
  source = "../../modules/archive"

  source_content          = file(var.source_code_path)
  source_content_filename = "lambda.js"
}
