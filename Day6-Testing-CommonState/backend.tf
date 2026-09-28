terraform {
  backend "s3" {
    bucket = "ashwin-ram-test-bucket"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}