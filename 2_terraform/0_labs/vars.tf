variable "private-key-aws-keygen" {
  default = "terraform-aws-keygen"
}
variable "ami-list" {
  type = map
  default = {

    #Ubuntu Server 20.04 LTS (HVM)
    #ami = "ami-090006f29ecb2d79a"
    #Red Hat Enterprise Linux 8 (HVM)
    #ami = "ami-0c2485d67d416fc4f"9
    "sa-east-1" = "ami-090006f29ecb2d79a"

    #Ubuntu Server 20.04 LTS (HVM)
    #ami = "ami-04505e74c0741db8d"
    #Red Hat Enterprise Linux 8 (HVM)
    #ami = "ami-0b0af3577fe5e3532"
    "us-east-1" = "ami-0b0af3577fe5e3532"
  }
}
variable "cidr-list-remote-access" {
  type = list
  default = ["177.102.167.65/32","201.92.251.213/32"]
}
variable "cidr-list-outbound-update" {
  type = list
  default = ["91.189.88.142/32","91.189.88.143/32"]
}