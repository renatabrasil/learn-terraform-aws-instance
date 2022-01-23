module "music" {
  source = "terraform-aws-modules/dynamodb-table/aws"

  name      = "music"
  hash_key  = "artist"
  range_key = "song"

  billing_mode   = "PROVISIONED"
  write_capacity = 1
  read_capacity  = 1

  attributes = [
    {
      name = "artist"
      type = "S"
    },
    {
      name = "song"
      type = "S"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}