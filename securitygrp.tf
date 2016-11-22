resource "aws_security_group" "default" {
  description = "Minimum functional ACLs for Windows node"

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
