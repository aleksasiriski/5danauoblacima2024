# output "filename" {
#   value = "${data.archive_file.archive.source_content_filename}.zip"
# }

output "filename" {
  value = "${var.source_content_filename}.zip"
}

output "output_base64" {
  value     = filebase64("${path.module}/tmp/lambda.zip")
  sensitive = true // So it doesn't show up in the plan output
}

output "output_base64sha256" {
  value = filebase64sha256("${path.module}/tmp/lambda.zip")
}