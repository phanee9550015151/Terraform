# output "instance_public_ip" {
#   value = aws_instance.example.public_ip
# }

# output "vpc_id" {
#   value = aws_vpc.main.id
# }

output "instance_public_ip" {
  description = "Public IP of the imported EC2 instance"
  value       = aws_instance.imported.public_ip
}
