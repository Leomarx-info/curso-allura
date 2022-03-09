provider "aws" {
  #deprecated
  #version = "~> 2.0"
  alias = "sa-east-1"
  region = "sa-east-1"
}

resource "aws_instance" "labs-alura-sa-east-1" {
  provider = aws.sa-east-1
  #Ubuntu Server 20.04 LTS (HVM)
  ami = "ami-090006f29ecb2d79a"
  #Red Hat Enterprise Linux 8 (HVM)
  #ami = "ami-0c2485d67d416fc4f"9

  count = 3
  instance_type = "t2.micro"
  key_name = "terraform-aws-keygen"
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
  #Ubuntu Server 20.04 LTS (HVM)
  #ami = "ami-04505e74c0741db8d"
  #Red Hat Enterprise Linux 8 (HVM)
  ami = "ami-0b0af3577fe5e3532"

  count = 3
  instance_type = "t2.micro"
  key_name = "terraform-aws-keygen"
  tags = {
    Name = "lab${count.index}"
  }
  #vpc_security_group_ids = ["sg-01b768ceef80390a0", "sg-059e6f0d6624bc548"]
  vpc_security_group_ids = ["${aws_security_group.inbound-ssh-access-us-east-1.id}", "${aws_security_group.outbound-http-update-ubuntu-us-east-1.id}"]
}
