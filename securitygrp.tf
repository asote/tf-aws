resource "aws_security_group" "tier1" {
  description = "Security group for subnet aws_subnet.tier1"

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
