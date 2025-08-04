terraform {
  backend "s3" {
    bucket         = "myterrabucket95"
    key            = "terraform/state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}
