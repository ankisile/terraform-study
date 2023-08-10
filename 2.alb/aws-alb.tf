resource "aws_security_group" "alb-sg" {
  name        = "alb-sg"
  description = "Allow web inbound traffic"
  vpc_id      = "vpc-09e773ed851df82bb"

  ingress {
    description = "Web from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-sg"
  }
}

resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb-sg.id]
  subnets            = ["subnet-06fc1008a97a30ecf","subnet-02cb08a6d04074e98"]
#  subnets            = aws_subnet.public.*.id
#   vpc_security_group_ids = [aws_security_group.web.id]

  enable_deletion_protection = false

/*
  access_logs {
    bucket  = aws_s3_bucket.lb_logs.bucket
    prefix  = "test-lb"
    enabled = true
  }
*/

  tags = {
    Name = "aws_lb"
  }

}