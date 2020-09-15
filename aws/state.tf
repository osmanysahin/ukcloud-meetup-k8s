 terraform  {
  backend  "s3" {
    bucket = "meetup-tfstate"
    key    = "tf/terraform.tfstate"
    region = "eu-west-2"
  }
}