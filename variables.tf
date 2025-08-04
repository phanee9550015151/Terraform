variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-0fb0b230890ccd1e6"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = "10.0.1.0/24"
}

variable "availability_zone" {
  default = "us-east-1a"
}