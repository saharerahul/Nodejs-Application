
resource "aws_instance" "demo-server" {
  ami                         = data.aws_ami.ubuntu.id
  key_name                    = var.key
  instance_type               = var.instance-type
  iam_instance_profile        = aws_iam_instance_profile.eks_instance_profile.name
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.demo_subnet-1.id
  vpc_security_group_ids      = [aws_security_group.demo-vpc-sg.id]
   
   tags = {

    Name = "bastion-host"
   }

}


# Creating VPC

resource "aws_vpc" "demo-vpc" {
  cidr_block = var.vpc-cidr
}

# Creating Subnets

resource "aws_subnet" "demo_subnet-1" {
  vpc_id                  = aws_vpc.demo-vpc.id
  cidr_block              = var.subnet1-cidr
  availability_zone       = var.subent_az
  map_public_ip_on_launch = "true"

  tags = {
    Name = "demo_subnet-1"
  }
}

resource "aws_subnet" "demo_subnet-2" {
  vpc_id                  = aws_vpc.demo-vpc.id
  cidr_block              = var.subnet2-cidr
  availability_zone       = var.subent_az-2
  map_public_ip_on_launch = "true"

  tags = {
    Name = "demo_subnet-2"
  }
}

# Creating Internet Gateway

resource "aws_internet_gateway" "demo-igw" {
  vpc_id = aws_vpc.demo-vpc.id

  tags = {
    Name = "demo-igw"
  }
}

#creating route table

resource "aws_route_table" "demo-rt" {
  vpc_id = aws_vpc.demo-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo-igw.id
  }
  tags = {
    Name = "demo-rt"
  }
}

# associating  subnets with route table 

resource "aws_route_table_association" "demo-rt_association-1" {
  subnet_id      = aws_subnet.demo_subnet-1.id
  route_table_id = aws_route_table.demo-rt.id
}

resource "aws_route_table_association" "demo-rt_association-2" {
  subnet_id = aws_subnet.demo_subnet-2.id

  route_table_id = aws_route_table.demo-rt.id
}


# creating a security group for vpc 

resource "aws_security_group" "demo-vpc-sg" {
  name = "demo-vpc-sg"

  vpc_id = aws_vpc.demo-vpc.id

  dynamic "ingress" {
    for_each = var.ingress_ports
    iterator = port
    content {
        description      = "TLS from VPC"
        from_port        = port.value      
        to_port          = port.value
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  tags = {
    Name = "allow_tls"
  }
}

