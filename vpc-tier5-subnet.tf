# Create Management subnet
resource "aws_subnet" "tier5-sub" {
  vpc_id                  = "${aws_vpc.default.id}"
  availability_zone       = "us-east-1b"
  cidr_block              = "10.0.0.128/25"
  map_public_ip_on_launch = true

  tags {
    Name          = "tier5-sub"
    Resource      = "Subnet"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}
