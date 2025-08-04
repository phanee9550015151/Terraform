provider "aws" {
  region = "us-east-1"  # replace with your region
}

resource "aws_instance" "imported" {
  # No config needed before import
  ami           = "ami-0de716d6197524dd9"
  instance_type = "t3.medium"  # new instance type you want
}
