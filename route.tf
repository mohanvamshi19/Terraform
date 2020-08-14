
resource "aws_default_route_table" "public" {
  default_route_table_id = aws_vpc.nurturey_base.main_route_table_id

  tags = {
    Name = "var.service_name-public"
  }
}

resource "aws_route" "public_internet_gateway" {
  count                  = length(var.subnets_cidr_public)
  route_table_id         = aws_default_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.nurturey_igw.id

  timeouts {
    create = "5m"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.nurturey_base.id

  tags = {
    Name = "var.service_name-private"
  }
}


resource "aws_route_table_association" "private" {
  count          = length(var.subnets_cidr_private)
  subnet_id      = element(aws_subnet.nurturey_private_subnets.*.id, count.index)
  route_table_id = aws_route_table.private.id
}

resource "aws_eip" "nat" {
  count = "2"
  vpc = true

  tags = {
    Name = "var.service_name-eip"
  }
}

# asssigning natgateway to the subnets
resource "aws_nat_gateway" "nat_gw" {
  count = "2"
  allocation_id = element(aws_eip.nat.*.id,count.index)
  subnet_id = element(aws_subnet.nurturey_private_subnets.*.id,count.index)
  tags = {
    Name = "var.service_name-nat-gw"
  }

}

