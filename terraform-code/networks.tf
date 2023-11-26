resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name = "main"
    }
}

resource "aws_subnet" "public_subnet" {
    
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"

    tags = {
      Name = "Public_subnet"
    }
}



resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main.id

    tags = {
      Name = "ig"
    }
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    tags = {
      Name = "route-table"
    }
}

resource "aws_route" "public_route" {
    gateway_id = aws_internet_gateway.gw.id
    route_table_id = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
}
resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public.id
}

