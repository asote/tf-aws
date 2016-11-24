# Create DC subnet

resource "aws_subnet" "tier4-sub" {
  vpc_id            = "${aws_vpc.default.id}"
  availability_zone = "us-east-1b"
  cidr_block        = "10.0.4.0/27"

  tags {
    Name          = "tier4-sub"
    Resource      = "subnet"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}
