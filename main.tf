# This should be in main.tf
resource "aws_vpc" "main" {
  for_each = var.vpcs

  cidr_block           = each.value.cidr_block
  enable_dns_support   = each.value.enable_dns_support
  enable_dns_hostnames = each.value.enable_dns_hostnames

  tags = {
    Name = each.key
  }
}