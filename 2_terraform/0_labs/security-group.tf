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