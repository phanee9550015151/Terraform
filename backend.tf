terraform {
  backend "s3" {
    bucket         = "myterrabucket95"                          # Your S3 bucket name
    key            = "terraform/state/terraform.tfstate"        # Path in the bucket where terraform.tfstate file will be stored in the s3 bucket 
    region         = "us-east-1"                                # AWS region
    encrypt        = true                                                          
  }
}
