# This below code is used to create mutliple vpcs using for each concept
# This file should be in varibales.tf
variable "vpcs" {
  type = map(object({
    cidr_block = string
    enable_dns_support   = bool
    enable_dns_hostnames = bool
  }))

  default = {
    vpc1 = {
      cidr_block           = "10.5.0.0/16"
      enable_dns_support   = true
      enable_dns_hostnames = true
    }
    vpc2 = {
      cidr_block           = "10.4.0.0/16"
      enable_dns_support   = true
      enable_dns_hostnames = false
    }
  }
}