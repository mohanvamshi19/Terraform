# VPC creation

resource "aws_vpc" "nurturey_base" {
	cidr_block = var.vpc_cidr

# Tags declartions

	tags = {
	name = "nurturey"
	}
}



# subnets: public

resource "aws_subnet" "nurturey_public_subnets" {
	vpc_id = aws_vpc.nurturey_base.id
	count = length(var.subnets_cidr_public)
	cidr_block = element(var.subnets_cidr_public,count.index)
	availability_zone = element(var.az,count.index)

	tags = {
	name = "subnet_count.index+1"
	}
	
}


# subnets : private

resource "aws_subnet" "nurturey_private_subnets" {
	vpc_id = aws_vpc.nurturey_base.id
	count = length(var.subnets_cidr_private)
	cidr_block = element(var.subnets_cidr_private,count.index)
	availability_zone = element(var.az,count.index)

	tags = {
	name = "subnet_count.index+1"
	}
	
}


# internet gateway creation


resource "aws_internet_gateway" "nurturey_igw" {
	vpc_id = aws_vpc.nurturey_base.id
 
	tags = {
	name = "Nurturey Base"
	}

}