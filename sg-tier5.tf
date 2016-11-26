# Security group for the web
resource "aws_security_group" "mgt" {
  name        = "mgt-tier5-sg"
  description = "Security group for RDP traffic from all subnets to mgt subnet for bastion host."
  vpc_id      = "${aws_vpc.default.id}"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name          = "mgt-tier5-sg"
    Resource      = "SG"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}
