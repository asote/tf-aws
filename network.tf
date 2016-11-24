# Create VPC
resource "aws_vpc" "default" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags {
    Name          = "terraform-aws-vpc"
    Resource      = "VPC"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}

# Create Web subnet
resource "aws_subnet" "tier1-sub" {
  vpc_id                  = "${aws_vpc.default.id}"
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  depends_on              = ["aws_internet_gateway.default"]

  tags {
    Name          = "tier1-sub"
    Resource      = "Subnet"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}

# Create App subnet

resource "aws_subnet" "tier2-sub" {
  vpc_id            = "${aws_vpc.default.id}"
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.2.0/24"

  tags {
    Name          = "tier2-sub"
    Resource      = "Subnet"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}

# Create Data subnet

resource "aws_subnet" "tier3-sub" {
  vpc_id            = "${aws_vpc.default.id}"
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.3.0/24"

  tags {
    Name          = "tier3-sub"
    Resource      = "subnet"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}

# Create DC subnet
resource "aws_subnet" "tier4-sub" {
  vpc_id            = "${aws_vpc.default.id}"
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.4.0/27"

  tags {
    Name = "tier4-sub"
  }
}

# Create Management subnet
resource "aws_subnet" "tier5-sub" {
  vpc_id            = "${aws_vpc.default.id}"
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.0.128/25"

  tags {
    Name          = "tier5-sub"
    Resource      = "Subnet"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}

# Create IGW for web subnet
resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name          = "Internet-Gateway"
    Resource      = "IGW"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}

# Create route table for web subnet
resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.default.id}"
  }

  tags {
    Name          = "Route Table"
    Resource      = "RT"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}

# Associate route table with web subnet
resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.tier1-sub.id}"
  route_table_id = "${aws_route_table.public.id}"
}

# Create internet facing lb for eb subnet
resource "aws_elb" "web" {
  name               = "ext-elb"
  #availability_zones = ["us-east-1a", "us-east-1b"]
  subnets            = ["${aws_subnet.tier1-sub.id}"]
  security_groups    = ["${aws_security_group.web.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  instances = ["${aws_instance.web.*.id}"]

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 5
  }

  tags {
    Name          = "External-LB"
    Resource      = "ELB"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}
