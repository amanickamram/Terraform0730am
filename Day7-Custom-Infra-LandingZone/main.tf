### Creation of VPC, Subnets, Internet Gateway, Route Table, Security Groups

resource "aws_vpc" "Prod" {
    cidr_block = "10.0.0.0/16"
    tags={
        name = "Prod-VPC"
    }
  
}

resource "aws_subnet" "Public-Subnet" {
    vpc_id = aws_vpc.Prod.id
    availability_zone = "us-east-1a"
  cidr_block = "10.0.1.0/24"
  tags = {
    name = "Public Subnet"
  }
}

resource "aws_subnet" "Private-Subnet" {
  vpc_id = aws_vpc.Prod.id
  availability_zone = "us-east-1a"
  cidr_block = "10.0.2.0/24"
  tags={
    name = "Private Subet"
  }
}

resource "aws_internet_gateway" "Prod" {
        vpc_id = aws_vpc.Prod.id
        tags = {
          name = "Prod-Internet-Gateway"
        }
}

resource "aws_route_table" "Prod" {
  vpc_id = aws_vpc.Prod.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Prod.id
    }
}

resource "aws_route_table_association" "Prod" {
    route_table_id = aws_route_table.Prod.id
    subnet_id = aws_subnet.Public-Subnet.id 
  
}

resource "aws_security_group" "Prod" {
    name = "Prod-SG"
    description = "Allow SSH ant HTTP traffic"
    vpc_id = aws_vpc.Prod.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
  egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

#create a nat-gateway and associate to private subnet. -- Veera task
# nat-gateway and rounte table and association. 


resource "aws_instance" "Prod" {
  ami = "ami-0fef201115eefe936"
  subnet_id = aws_subnet.Public-Subnet.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.Prod.id]
  tags = {
    name = "PROD-EC2"
  }
}