resource "aws_network_acl" "tier4-sub" {
  vpc_id     = "${aws_vpc.default.id}"
  subnet_ids = ["${aws_subnet.tier4-sub.id}"]

  tags {
    Name          = "nacl-tier4-sub"
    Resource      = "Subnet"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}

resource "aws_network_acl_rule" "all" {
  network_acl_id = "${aws_network_acl.tier4-sub.id}"
  rule_number    = 100
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "10.0.4.0/27"
  from_port      = "0"
  to_port        = "0"
}

resource "aws_network_acl_rule" "rdp-tier4" {
  network_acl_id = "${aws_network_acl.tier4-sub.id}"
  rule_number    = 120
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.0.128/25"
  from_port      = 3389
  to_port        = 3389
}

resource "aws_network_acl_rule" "outbound-tier4" {
  network_acl_id = "${aws_network_acl.tier4-sub.id}"
  rule_number    = 130
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = "0"
  to_port        = "0"
}
