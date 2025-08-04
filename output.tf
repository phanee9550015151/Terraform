# output "instance_public_ip" {
#   description = "Public IP of the Terraform-managed EC2 instance"
#   value       = aws_instance.example.public_ip
# }


output "vpc_ids" {
  value = { for k, v in aws_vpc.test_vpc : k => v.id }
}

