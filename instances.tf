# instance  ------------- public subnet 1

resource "aws_instance" "webservers_public_0" {
	count = length(var.subnets_cidr_public) 
	ami = var.webserver_ami
	instance_type = var.instance_type
	vpc_security_group_ids = [aws_security_group.nurturey_sg.id]
	subnet_id = element(aws_subnet.nurturey_public_subnets.*.id,0)
	user_data = file("install_http.sh")

	tags = {
	  Name = "Server-public_0-${count.index}"
	}
}

# instance ----------------- public subnet 2

resource "aws_instance" "webservers_public_1" {
	count = length(var.subnets_cidr_public) 
	ami = var.webserver_ami
	instance_type = var.instance_type
	vpc_security_group_ids = [aws_security_group.nurturey_sg.id]
	subnet_id = element(aws_subnet.nurturey_public_subnets.*.id,0)
	user_data = file("install_http.sh")

	tags = {
	  Name = "Server-public_1-${count.index}"
	}
}



# instance  ----------------- private subnet 1
resource "aws_instance" "webservers_private_0" {
	count = length(var.subnets_cidr_public) 
	ami = var.webserver_ami
	instance_type = var.instance_type
	vpc_security_group_ids = [aws_security_group.nurturey_sg.id]
	subnet_id = element(aws_subnet.nurturey_private_subnets.*.id,0)
	user_data = file("install_http.sh")

	tags = {
	  Name = "Server-private_0-${count.index}"
	}
}


# instances ---------------------- private subnet 2
resource "aws_instance" "webservers_private_1" {
	count = length(var.subnets_cidr_public) 
	ami = var.webserver_ami
	instance_type = var.instance_type
	vpc_security_group_ids = [aws_security_group.nurturey_sg.id]
	subnet_id = element(aws_subnet.nurturey_private_subnets.*.id,1)
	user_data = file("install_http.sh")

	tags = {
	  Name = "Server-private_1-${count.index}"
	}
}

