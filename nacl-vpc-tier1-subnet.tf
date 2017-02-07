resource "aws_network_acl" "tier1-sub" {
  vpc_id     = "${aws_vpc.default.id}"
  subnet_ids = ["${aws_subnet.tier1-sub.id}"]

  tags {
    Name          = "nacl-tier1-sub"
    Resource      = "Subnet"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}

resource "aws_network_acl_rule" "http-in" {
  network_acl_id = "${aws_network_acl.tier1-sub.id}"
  rule_number    = 100
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "https-in" {
  network_acl_id = "${aws_network_acl.tier1-sub.id}"
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "rdp-in" {
  network_acl_id = "${aws_network_acl.tier1-sub.id}"
  rule_number    = 300
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.0.128/25"
  from_port      = 3389
  to_port        = 3389
}

resource "aws_network_acl_rule" "custom_tcp-in" {
  network_acl_id = "${aws_network_acl.tier1-sub.id}"
  rule_number    = 400
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}

resource "aws_network_acl_rule" "http-out" {
  network_acl_id = "${aws_network_acl.tier1-sub.id}"
  rule_number    = 100
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

resource "aws_network_acl_rule" "https-out" {
  network_acl_id = "${aws_network_acl.tier1-sub.id}"
  rule_number    = 200
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "rdp-out" {
  network_acl_id = "${aws_network_acl.tier1-sub.id}"
  rule_number    = 300
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "10.0.0.128/25"
  from_port      = 3389
  to_port        = 3389
}

resource "aws_network_acl_rule" "custom_tcp-out" {
  network_acl_id = "${aws_network_acl.tier1-sub.id}"
  rule_number    = 400
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 1024
  to_port        = 65535
}
