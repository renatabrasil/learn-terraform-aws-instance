//module "kinesis-firehose" {
//  source                                = "git::https://github.com/felipefrizzo/terraform-aws-kinesis-firehose.git?ref=master"
//  region                                = "us-west-2"
//  kinesis_firehose_stream_name          = "music_stream"
//  kinesis_firehose_stream_backup_prefix = "bck"
//  bucket_name                           = "music_s3"
//  cloudwatch_log_group_name             = "music_table_backup"
//}

resource "aws_kinesis_firehose_delivery_stream" "extended_s3_stream" {
  name        = "music_stream"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehose_role.arn
    bucket_arn = aws_s3_bucket.musics3.arn

    //    processing_configuration {
    //      enabled = "true"
    //
    //      processors {
    //        type = "Lambda"
    //
    //        parameters {
    //          parameter_name  = "LambdaArn"
    //          parameter_value = "${aws_lambda_function.lambda_processor.arn}:$LATEST"
    //        }
    //      }
    //    }
  }
}

resource "aws_s3_bucket" "musics3" {
  bucket = "musics3"
  acl    = "private"
}

resource "aws_iam_role" "firehose_role" {
  name = "firehose_test_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}