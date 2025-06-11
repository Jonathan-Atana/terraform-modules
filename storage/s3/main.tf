/**
 * # Description
 *
 * This Terraform configuration creates an AWS S3 bucket
 *
 * ---
 *
 */

resource "aws_s3_bucket" "main" {
  bucket = var.bucket_name
}