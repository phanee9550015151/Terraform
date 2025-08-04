output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.moduleinstance.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.moduleinstance.public_ip
}
