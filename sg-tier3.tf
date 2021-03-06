# Security group for the web
resource "aws_security_group" "sql" {
  name        = "sql-tier3-sg"
  description = "Security group for SQL that allows traffic from tier3"
  vpc_id      = "${aws_vpc.default.id}"

  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["10.0.2.0/24"]
  }

  # Allo RDP requests from mgt subnet (for bastion host)
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.128/25"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name          = "sql-tier3-sg"
    Resource      = "SG"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}
