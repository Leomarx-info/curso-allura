output "instance-Name"{
  value = aws_instance.labs-alura-sa-east-1[1].tags.Name
}
output "instance-IPs"{
  value = aws_instance.labs-alura-sa-east-1[1].public_ip
}
#TODO check how to print all resources