output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.app_server.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.app_server.public_ip
}

output "instance_public_dns" {
  description = "Public DNS name of the EC2 instance"
  value       = aws_instance.app_server.public_dns
}

output "security_group_id" {
  description = "ID of the security group attached to the instance"
  value       = aws_security_group.app_sg.id
}

output "ssh_command" {
  description = "Convenience SSH command"
  value       = "ssh -i ~/${var.key_name}.pem ubuntu@${aws_instance.app_server.public_ip}"
}
