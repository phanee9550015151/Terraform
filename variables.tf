# variable "region" {
#   default     = "us-east-1"
#   description = "AWS region to deploy resources in"
# }

# variable "ami" {
#   default     = "ami-0fb0b230890ccd1e6" # Ubuntu 20.04
#   description = "AMI ID for the EC2 instance"
# }

# variable "instance_type" {
#   default     = "t2.micro"
#   description = "EC2 instance type"
# }

# variable "vpc_cidr" {
#   default     = "10.0.0.0/16"
#   description = "CIDR block for the VPC"
# }

# variable "public_subnet_cidr" {
#   default     = "10.0.1.0/24"
#   description = "CIDR block for the public subnet"
# }

# variable "availability_zone" {
#   default     = "us-east-1a"
#   description = "Availability Zone for the subnet"
# }

# variable "key_name" {
#   description = "Name of the AWS key pair to use for SSH"
#   default     = "terraform-key"
# }
# ===================================================================
 

# this is data sorces method of resources

# variable "region" {
#   default = "us-east-1"
# }

# variable "instance_type" {
#   default = "t2.micro"
# }

# variable "key_name" {
#   description = "Name of the existing AWS key pair"
# }
# =================================================================

# variables "region" {
#   type    =  string
#   default = "us-east-1"
# }

# variable "cidr_block" {
#   type    =  string
#   default = "10.5.0.0/16"
# }
# ===============================================================

# variable "ami" {
#   type = string
#   default = "ami-0de716d6197524dd9"
# }

# variable "instance_type" {
#   type       =  string
#   default    =  "t2.micro"
# }

# variable "subnet_id" {
#   type =   string
#   default = "subnet-07604d054e3d6a633"
# }

# variable "vpc_security_group_ids" {
#   type    = list(string)
#   default = ["sg-09b1f10b14f052064"]
# }


# variable "key_name" {
#   type =   string
#   default = "terraform keypair"
# }

