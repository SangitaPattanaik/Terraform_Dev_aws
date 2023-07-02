resource "aws_s3_bucket" "tf_state_s3" {
  bucket = var.s3_bucket_name

  tags = { "ResourceName" = var.s3_bucket_name }
}

resource "aws_s3_bucket_acl" "tf_state_s3_acl" {
  bucket = aws_s3_bucket.tf_state_s3.id
  acl    = var.acl
}

resource "aws_s3_bucket_public_access_block" "tf_state_s3_access" {
  bucket                  = aws_s3_bucket.tf_state_s3.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_versioning" "tf_state_s3_version" {
  bucket = aws_s3_bucket.tf_state_s3.id

  versioning_configuration {
    status = var.s3_versioning
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_s3_encryp" {
  bucket = aws_s3_bucket.tf_state_s3.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.tf_state_s3_key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_kms_key" "tf_state_s3_key" {
  description             = "s3 bucket encryption key"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_lifecycle_configuration" "tf_state_s3_lifecycle" {
  # Bbucket versioning enabled first

  depends_on = [aws_s3_bucket_versioning.tf_state_s3_version]

  bucket = aws_s3_bucket.tf_state_s3.id
  count  = (var.enable_lifecycle_rule == true ? 1 : 0)
  rule {
    id = "config"

    filter {
      prefix = "config/"
    }

    noncurrent_version_expiration {
      noncurrent_days = 90
    }

    noncurrent_version_transition {
      noncurrent_days = 30
      storage_class   = "STANDARD_IA"
    }

    noncurrent_version_transition {
      noncurrent_days = 60
      storage_class   = "GLACIER"
    }

    status = "Enabled"
  }
}
  