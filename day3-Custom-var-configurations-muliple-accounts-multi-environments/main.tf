resource "aws_instance" "devname" {
  ami = var.dev_ami_id
  instance_type = var.dev_instance_type
  provider = aws.DevProfile
  tags = {
    name="Dev-Instance"
  }
}

resource "aws_instance" "testname" {
  ami = var.test_ami_id
  instance_type = var.test_instance_type
  tags = {
    name="Test-Instance"
  }
}