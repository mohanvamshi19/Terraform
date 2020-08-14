
# create a new load balancer 
resource "aws_elb" "nurturey-elb" {
  name               = "nurturey"
  #availability_zones = ["${var.az}"]
  # count = length(var.subnets_cidr_public)
  subnets = [element(aws_subnet.nurturey_public_subnets.*.id,0)]

  security_groups = [aws_security_group.nurturey_sg.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 5
  }

  instances                   = [element(aws_instance.webservers_public_0.*.id,0),element(aws_instance.webservers_public_0.*.id,1)]

  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 300

  tags = {
    Name = "nurturey-elb"
  }
}

output "elb-dns-name" {
    value = aws_elb.nurturey-elb.dns_name
}