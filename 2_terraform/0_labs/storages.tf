resource "aws_s3_bucket" "lab-storage" {
  bucket = "lab-storage-nfs"
  #deprecated
  #acl = "private"
  tags = {
    Name = "storage"
  }
}