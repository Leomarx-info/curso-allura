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

resource "aws_s3_bucket" "lab-storage" {
  bucket = "lab-storage-nfs"
  #deprecated
  #acl = "private"
  tags = {
    Name = "storage"
  }
}