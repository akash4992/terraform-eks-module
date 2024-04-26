resource "aws_s3_bucket" "dev-cps-s3" {
  bucket = var.s3_bucket_name
  tags = {
    Name  = var.s3_bucket_name
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.dev-cps-s3.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.dev-cps-s3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}