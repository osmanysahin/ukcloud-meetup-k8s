provider "aws" {
  profile = "default"
  region  = var.region
}
data "aws_region" "current" {}

data "aws_availability_zones" "available" {}



