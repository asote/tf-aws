resource "aws_vpc" "default" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "dedicated"
  enable_dns_hostnames = true

  tags {
    Name = "terraform-aws-vpc"
  }
}

resource "aws_subnet" "tier1-sub" {
  vpc_id            = "${aws_vpc.default.id}"
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.1.0/24"

  tags {
    Name = "tier1-sub"
  }
}

resource "aws_subnet" "tier2-sub" {
  vpc_id            = "${aws_vpc.default.id}"
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.2.0/24"

  tags {
    Name = "tier2-sub"
  }
}

resource "aws_subnet" "tier3-sub" {
  vpc_id            = "${aws_vpc.default.id}"
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.3.0/24"

  tags {
    Name = "tier3-sub"
  }
}
