module "kinesis-firehose" {
  source                                = "felipefrizzo/kinesis-firehose/aws"
  version                               = "0.0.4"
  region                                = "us-west-2"
  kinesis_firehose_stream_name          = "music_stream"
  kinesis_firehose_stream_backup_prefix = "bck"
  bucket_name                           = "music_s3"
  cloudwatch_log_group_name             = "music_table_backup"
}
