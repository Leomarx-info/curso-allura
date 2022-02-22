provider "aws" {
  #deprecated
  #version = "~> 2.0"
  region = "sa-east-1"
}

resource "aws_instance" "labs-alura" {
  #Ubuntu Server 20.04 LTS (HVM)
  ami = "ami-090006f29ecb2d79a"
  #Red Hat Enterprise Linux 8 (HVM)
  #ami = "ami-0c2485d67d416fc4f"

  count = 3
  instance_type = "t2.micro"
  key_name = "terraform-aws-keygen"
  tags = {
    Name = "lab${count.index}"
  }
}

resource "aws_security_group" "ssh-access" {
  name = "ssh-config"
  description = "ssh-config"

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["177.102.167.65/32"]
  }
  tags = {
    Name = "ssh"
  }
}