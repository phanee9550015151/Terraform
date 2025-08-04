variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro" #we can use default values here and this gets overridden when provide the values in root/main.tf
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the instance"
  type        = string
}
