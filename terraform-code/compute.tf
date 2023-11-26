resource "aws_instance" "web-server" {

    ami = "ami-0989fb15ce71ba39e"
    instance_type = "t3.micro"
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.ssh_access.id]  
    associate_public_ip_address = true
    user_data = <<-EOF
        #!/bin/bash
        # Update the package list
        sudo apt update

        # Install Apache
        sudo apt install -y apache2
        sudo cat <<HTML > /var/www/html/index.html
        <!DOCTYPE html>
        <html><body><h1>Welcome to Shubhankar's Terraform project</h1></body></html>
        HTML
        sudo systemctl restart apache2
    EOF
}
