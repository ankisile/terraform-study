resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow web inbound traffic"
  vpc_id      = "vpc-09e773ed851df82bb"

  ingress {
    description = "Web from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "default-sg"
  }
}
