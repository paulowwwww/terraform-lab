resource "aws_vpc" "vpc_lab" {
    cidr_block           = var.vpcCIDRblock
    enable_dns_hostnames = true
    enable_dns_support   = true

    tags = {
        Name = "VPC LAB"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id                  = aws_vpc.vpc_lab.id
    cidr_block              = var.subnetCIDRpublic
    availability_zone       = var.AvailabilityZone
    map_public_ip_on_launch = true

    tags = {
      Name = "SubNet Publica"
    }
}

resource "aws_internet_gateway" "igw_lab" {
    vpc_id = aws_vpc.vpc_lab.id

    tags = {
      Name = "IGW LAB"
    } 
}

resource "aws_route_table" "Public_RT" {
    vpc_id = aws_vpc.vpc_lab.id

    tags = {
      Name = "Public Route Table"
    }
}

resource "aws_route" "access_internet" {
    route_table_id         = aws_route_table.Public_RT.id
    destination_cidr_block = var.subnetCIDRpublic
    gateway_id             = aws_internet_gateway.igw_lab.id
  
}

resource "aws_route_table_association" "public_association" {
    subnet_id      = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.Public_RT.id
  
}


resource "aws_security_group" "ssh" {
    name = "ssh"
    description = "acesso ao ssh"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}
  
resource "aws_security_group" "https" {
    name = "https"
    description = "acesso ao https"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }
}

resource "aws_security_group" "http" {
    name = "http"
    description = "acesso ao http"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    
}