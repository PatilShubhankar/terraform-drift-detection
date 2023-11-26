output "comput-public-ip" {
  value = aws_instance.web-server.public_ip
}
