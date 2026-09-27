resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/24"
  tags = {
    Name="Ashwin VPC"
  }
}

resource "aws_instance" "name" {
  ami = "ami-0fef201115eefe936"
  instance_type = "t2.medium"
  tags = {
    name="Prod-Instance"
  }
}