# Create route table for web subnet
resource "aws_route_table" "bastion" {
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
resource "aws_route_table_association" "bastion" {
  subnet_id      = "${aws_subnet.tier5-sub.id}"
  route_table_id = "${aws_route_table.bastion.id}"
}
