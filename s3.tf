####################################################################
# S3 Bucket

resource "aws_s3_bucket" "etl_analysis" {
  bucket = "${lower(var.project)}-bucket"
  acl    = "private"
}

resource "null_resource" "remove_and_upload_to_s3" {
  provisioner "local-exec" {
    command = "aws s3 sync ${path.module}/data s3://${aws_s3_bucket.etl_analysis.id} --delete --region ${var.aws_region}"
  }
}
