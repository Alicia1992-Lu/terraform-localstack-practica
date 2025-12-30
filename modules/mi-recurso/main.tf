# modules/mi-recurso/main.tf
# Definición del recurso S3 como módulo reutilizable

resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = merge(
    {
      Name        = var.bucket_name
      Environment = var.environment
      ManagedBy   = "Terraform-Module"
    },
    var.tags
  )
}

resource "aws_s3_bucket_versioning" "this" {
  count  = var.enable_versioning ? 1 : 0
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}
