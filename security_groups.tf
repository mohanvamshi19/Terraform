# indrasena kallam --- creating the security groups 

resource "aws_security_group" "nurturey_sg" {
# name of the protocal 

	name = "allow_http"

# description 
	description = "Allowing http inbound traffic"

# assiging the security group to a particular vpc 
	vpc_id = aws_vpc.nurturey_base.id

# inbound rules
# inbound rule for http
ingress {
	from_port = 80
	to_port = 80
	protocol = "tcp"
	cidr_blocks = ["73.202.185.161/32"]
}


# inbound rules for ssh connections
ingress {
	from_port = 22
	to_port = 22
	protocol = "tcp"
	cidr_blocks = ["73.202.185.161/32"]
}

egress {
	from_port = 0
	to_port = 0
	protocol = "-1"
	cidr_blocks = ["0.0.0.0/0"]
	
}

tags = {
	name = "Nurturey_base_sg"
}


}

output "sg_name" {
	value = aws_security_group.nurturey_sg.id
}

