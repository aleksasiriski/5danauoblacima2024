data "archive_file" "archive" {
  type                    = "zip"
  source_content          = var.source_content
  source_content_filename = var.source_content_filename
  output_file_mode        = "0666"
  output_path             = "${path.module}/tmp/${var.source_content_filename}.zip"
}
