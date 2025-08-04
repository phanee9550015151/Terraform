
# This below code is used to create mutliple vpcs using for each concept
#  This file should be in varibales.tf
# variable "vpcs" {
#   type = map(object({
#     cidr_block = string
#     enable_dns_support   = bool
#     enable_dns_hostnames = bool
#   }))

#   default = {
#     vpc1 = {
#       cidr_block           = "10.0.0.0/16"
#       enable_dns_support   = true
#       enable_dns_hostnames = true
#     }
#     vpc2 = {
#       cidr_block           = "10.1.0.0/16"
#       enable_dns_support   = true
#       enable_dns_hostnames = false
#     }
#   }
# }

# This should be in main.tf
# resource "aws_vpc" "main" {
#   for_each = var.vpcs

#   cidr_block           = each.value.cidr_block
#   enable_dns_support   = each.value.enable_dns_support
#   enable_dns_hostnames = each.value.enable_dns_hostnames

#   tags = {
#     Name = each.key
#   }
# }
