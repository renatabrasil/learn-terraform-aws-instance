module "kinesis-firehose" {
  source                                = "git::https://github.com/felipefrizzo/terraform-aws-kinesis-firehose.git?ref=master"
  region                                = "us-west-2"
  kinesis_firehose_stream_name          = "music_stream"
  kinesis_firehose_stream_backup_prefix = "bck"
  bucket_name                           = "music_s3"
  cloudwatch_log_group_name             = "music_table_backup"
}
