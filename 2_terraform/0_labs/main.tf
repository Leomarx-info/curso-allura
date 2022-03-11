provider "aws" {
  #deprecated
  #version = "~> 2.0"
  alias = "sa-east-1"
  region = "sa-east-1"
}

resource "aws_instance" "labs-alura-sa-east-1" {
  provider = aws.sa-east-1
  ami = var.ami-list.sa-east-1
  count = 3
  instance_type = "t2.micro"
  key_name = var.private-key-aws-keygen
  tags = {
    Name = "lab${count.index}"
  }
  #vpc_security_group_ids = ["sg-01b768ceef80390a0", "sg-059e6f0d6624bc548"]
  vpc_security_group_ids = ["${aws_security_group.inbound-ssh-access-sa-east-1.id}", "${aws_security_group.outbound-http-update-ubuntu-sa-east-1.id}"]
}

provider "aws" {
  #deprecated
  #version = "~> 2.0"
  alias = "us-east-1"
  region = "us-east-1"
}

resource "aws_instance" "labs-alura-us-east-1" {
  provider = aws.us-east-1
  ami = var.ami-list.us-east-1
  count = 3
  instance_type = "t2.micro"
  key_name = var.private-key-aws-keygen
  tags = {
    Name = "lab${count.index}"
  }
  #vpc_security_group_ids = ["sg-01b768ceef80390a0", "sg-059e6f0d6624bc548"]
  vpc_security_group_ids = ["${aws_security_group.inbound-ssh-access-us-east-1.id}", "${aws_security_group.outbound-http-update-ubuntu-us-east-1.id}"]
}
