resource "aws_dynamodb_table" "basic-dynamodb-table-sa-east-1" {
  provider = aws.sa-east-1
  name = "GameScores"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "UserId"
  range_key = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}