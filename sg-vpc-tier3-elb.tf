resource "aws_security_group" "tier3-elb" {
  name        = "vpc-tier3-elb_sg"
  description = "Security group to access tier2 ELB over SQL"
  vpc_id      = "${aws_vpc.default.id}"

  # SQL access from tier2
  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["10.0.2.0/24"]
  }

  # outbound traffic access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name          = "vpc-tier3-elb_sg"
    Resource      = "SG"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}
