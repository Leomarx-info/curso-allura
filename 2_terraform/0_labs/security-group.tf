#Security sa-east-1
resource "aws_security_group" "inbound-ssh-access-sa-east-1" {
  provider = aws.sa-east-1
  name = "inbound-ssh-config"
  description = "inbound-ssh-config"

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = var.cidr-list-remote-access
  }
  tags = {
    Name = "inbound"
    Name = "ssh"
  }
}

resource "aws_security_group" "outbound-http-update-ubuntu-sa-east-1" {
  provider = aws.sa-east-1
  name = "outbound-http-config"
  description = "outbound-http-config"

  egress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.cidr-list-outbound-update
  }

  tags = {
    Name = "outbound"
    Name = "http"
  }
  depends_on = [aws_security_group.inbound-ssh-access-sa-east-1]
}

#Security us-east1
resource "aws_security_group" "inbound-ssh-access-us-east-1" {
  provider = aws.us-east-1
  name = "inbound-ssh-config"
  description = "inbound-ssh-config"

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = var.cidr-list-remote-access
  }
  tags = {
    Name = "inbound"
    Name = "ssh"
  }
}

resource "aws_security_group" "outbound-http-update-ubuntu-us-east-1" {
  provider = aws.us-east-1
  name = "outbound-http-config"
  description = "outbound-http-config"

  egress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = var.cidr-list-outbound-update
  }

  tags = {
    Name = "outbound"
    Name = "http"
  }
  depends_on = [aws_security_group.inbound-ssh-access-us-east-1]
}