module "s3_matches" {
  source = "../../modules/s3"

  bucket_name = "${var.project_name}-matches"
}