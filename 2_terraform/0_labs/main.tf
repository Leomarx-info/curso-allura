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
  #vpc_security_group_ids = ["sg-01b768ceef80390a0", "sg-059e6f0d6624bc548"]
  vpc_security_group_ids = ["${aws_security_group.inbound-ssh-access.id}", "${aws_security_group.outbound-http-update-ubuntu.id}"]
}

resource "aws_security_group" "inbound-ssh-access" {
  name = "inbound-ssh-config"
  description = "inbound-ssh-config"

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["177.102.167.65/32"]
  }
  tags = {
    Name = "inbound"
    Name = "ssh"
  }
}

resource "aws_security_group" "outbound-http-update-ubuntu" {
  name = "outbound-http-config"
  description = "outbound-http-config"

  egress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["91.189.88.142/32"]
  }

  tags = {
    Name = "outbound"
    Name = "http"
  }
  depends_on = [aws_security_group.inbound-ssh-access]
}

resource "aws_s3_bucket" "lab-storage" {
  bucket = "lab-storage-nfs"
  #deprecated
  #acl = "private"
  tags = {
    Name = "storage"
  }
}