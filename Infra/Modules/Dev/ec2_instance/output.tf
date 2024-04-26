# Optional output for the public IP address
output "public_ip" {
  value = aws_instance.main.public_ip
}