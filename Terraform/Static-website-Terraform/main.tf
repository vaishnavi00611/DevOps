terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# Create S3 Bucket
resource "aws_s3_bucket" "mystaticwebsiteproj_vaish" {
  bucket = "mystaticwebsiteproj-vaish"
}

# Allow public access settings (so it can be used for website hosting)
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.mystaticwebsiteproj_vaish.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Upload index.html
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.mystaticwebsiteproj_vaish.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}

# Upload style.css
resource "aws_s3_object" "style_css" {
  bucket       = aws_s3_bucket.mystaticwebsiteproj_vaish.id
  key          = "style.css"
  source       = "style.css"
  content_type = "text/css"
}
