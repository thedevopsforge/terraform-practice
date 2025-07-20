provider "aws" {
  region = "us-east-1"
}

# Security Group that allows SSH and HTTP
resource "aws_security_group" "nginx_sg" {
  name        = "nginx-security-group"
  description = "Allow SSH and HTTP inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (not secure for production)
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "nginx_server" {
  ami           = "ami-050fd9796aa387c0d"  # Amazon Linux 2023
  instance_type = "t3.micro"
  key_name      = "terraform-key"
  security_groups = [aws_security_group.nginx_sg.name]

  user_data = <<-EOF
              #!/bin/bash
              dnf update -y
              dnf install nginx -y
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "nginx-instance"
  }
}

output "public_ip" {
  value = aws_instance.nginx_server.public_ip
}
