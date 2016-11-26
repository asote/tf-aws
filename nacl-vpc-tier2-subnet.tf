resource "aws_network_acl" "tier2-sub" {
  vpc_id     = "${aws_vpc.default.id}"
  subnet_ids = ["${aws_subnet.tier2-sub.id}"]

  tags {
    Name          = "nacl-tier2-sub"
    Resource      = "Subnet"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}

resource "aws_network_acl_rule" "http-tier2" {
  network_acl_id = "${aws_network_acl.tier2-sub.id}"
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.1.0/24"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "https-tier2" {
  network_acl_id = "${aws_network_acl.tier2-sub.id}"
  rule_number    = 110
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.1.0/24"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "rdp-tier2" {
  network_acl_id = "${aws_network_acl.tier2-sub.id}"
  rule_number    = 120
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.0.128/25"
  from_port      = 3389
  to_port        = 3389
}

resource "aws_network_acl_rule" "outbound-tier2" {
  network_acl_id = "${aws_network_acl.tier2-sub.id}"
  rule_number    = 130
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = "0"
  to_port        = "0"
}
