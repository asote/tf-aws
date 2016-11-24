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
