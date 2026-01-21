resource "aws_s3_bucket" "s3" {
  bucket = "my-terraform-bucket-jull"
  tags = {
    Name        = "MyTerraformBucket"
    Environment = "Dev"
  }
}
