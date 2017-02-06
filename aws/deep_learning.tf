# VPC
resource "aws_vpc" "deep_learning" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${var.tag_name}"
  }
}

resource "aws_internet_gateway" "deep_learning" {
	vpc_id = "${aws_vpc.deep_learning.id}"
}

# Public subnet
resource "aws_subnet" "public_1" {
  vpc_id = "${aws_vpc.deep_learning.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "${lookup(var.availability_zone_1, "${var.region}")}"
}

# Routing table for public subnet
resource "aws_route_table" "public_1" {
	vpc_id = "${aws_vpc.deep_learning.id}"

	route {
		cidr_block = "0.0.0.0/0"
		gateway_id = "${aws_internet_gateway.deep_learning.id}"
	}
}

resource "aws_route_table_association" "public_1" {
	subnet_id = "${aws_subnet.public_1.id}"
	route_table_id = "${aws_route_table.public_1.id}"
}

# Servers
resource "aws_instance" "deep_learning" {
  ami = "${lookup(var.ami, "${var.region}")}"
  instance_type = "${var.instance_type}"
  key_name = "${var.ssh_key_name}"
  security_groups = ["${aws_security_group.deep_learning.name}"]

  connection = {
    user = "ubuntu"
    private_key = "${file("${var.ssh_key_path}")}"
  }

  tags = {
    Name = "${var.tag_name}"
  }
}

# Security Groups
resource "aws_security_group" "deep_learning" {
  name = "allow_from_internet"
  description = "Allows connections from the internet"

  # SSH
  ingress = {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP
  ingress = {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTPS
  ingress = {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Deep Learning Jupyter
  ingress = {
    from_port = 8888
    to_port = 8888
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
