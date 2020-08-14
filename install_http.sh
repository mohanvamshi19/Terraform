#!/bin/bash
sudo su
yum update -y
yum install -y httpd 
systemctl start httpd
systemctl enable httpd
systemctl is-enabled httpd