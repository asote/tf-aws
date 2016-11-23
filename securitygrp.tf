resource "aws_security_group" "tier1-sg" {
  name        = "tier1-sg"
  description = "Security group for subnet aws_subnet.tier1"
  vpc_id      = "${aws_vpc.as-vpc.id}"

  tags {
    Name = "security-win-vm"
  }

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
