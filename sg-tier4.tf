# Security group for the web
resource "aws_security_group" "dc" {
  name        = "dc-tier4-sg"
  description = "Security group for DC that allows traffic from tier3"
  vpc_id      = "${aws_vpc.default.id}"

  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["10.0.4.0/27"]
  }

  # Allo RDP requests from mgt subnet (for bastion host)
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.128/25"]
  }

  tags {
    Name          = "dc-tier4-sg"
    Resource      = "SG"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}
