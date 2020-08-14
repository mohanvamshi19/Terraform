
# variables declaration

variable "aws_region" {
	default = "us-east-1"
}

variable "vpc_cidr" {

	default = "10.0.0.0/16"
}


variable "az" {
    type = list
	default = ["us-east-1a", "us-east-1b"]
}

variable "private_az" {
    type = list
	default = ["us-east-1a", "us-east-1b"]
}

variable "service_name" {
	default = "Nurturey-base"
}



variable "subnets_cidr_public" {
    type = list
	default =["10.0.0.0/18","10.0.64.0/18"]
}

variable "subnets_cidr_private" {
    type = list
	default = ["10.0.128.0/18","10.0.192.0/18"]
}

variable "webserver_ami" {
	default = "ami-09d8b5222f2b93bf0"
}

variable "instance_type" {
	default = "t2.micro"
}
