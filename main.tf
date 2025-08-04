provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami = "ami-0fb0b230890ccd1e6"  # Ubuntu 20.04 - 2025-06-24
"
  instance_type = "t2.micro"
}
