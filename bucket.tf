module "music_s3" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "music_s3"
  acl    = "private"

  versioning = {
    enabled = true
  }

}