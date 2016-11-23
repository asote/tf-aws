resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "dedicated"

  tags {
    Name = "main"
  }
}

resource "aws_subnet" "tier1" {
  vpc_id            = "${aws_vpc.main.id}"
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.1.0/24"

  tags {
    Name = "tier1"
  }
}

resource "aws_subnet" "tier2" {
  vpc_id            = "${aws_vpc.main.id}"
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.2.0/24"

  tags {
    Name = "tier2"
  }
}

resource "aws_subnet" "tier3" {
  vpc_id            = "${aws_vpc.main.id}"
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.3.0/24"

  tags {
    Name = "tier3"
  }
}
