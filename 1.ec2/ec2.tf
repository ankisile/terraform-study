data "aws_ami" "amzn2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}

resource "aws_instance" "example" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t2.nano"
  key_name      = "terraformkey"
  vpc_security_group_ids = [aws_security_group.web.id]

  tags = {
    Name = "Terraform v2"
  }
}

resource "aws_instance" "example-2a" {
  ami           = data.aws_ami.amzn2.id # 위의 data 값을 불러옵니다.
  instance_type = "t2.micro"
  key_name      = "terraformkey"
  vpc_security_group_ids = [aws_security_group.web.id]
  subnet_id = "subnet-06fc1008a97a30ecf"
  availability_zone = "ap-northeast-2a"
  
  tags = {
    Name = "Terraform-ec2-2a"
  }
}

resource "aws_instance" "example-2c" {
  ami           = data.aws_ami.amzn2.id # 위의 data 값을 불러옵니다.
  instance_type = "t2.micro"
  key_name      = "terraformkey"
  vpc_security_group_ids = [aws_security_group.web.id]
  subnet_id = "subnet-02cb08a6d04074e98"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "Terraform-ec2-2c"
  }
}
