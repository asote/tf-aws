resource "aws_security_group" "tier2-elb" {
  name        = "vpc-tier2-elb_sg"
  description = "Security group to access tier2 ELB over HTTP"
  vpc_id      = "${aws_vpc.default.id}"

  # HTTP access from tier1
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  # outbound traffic access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.1.0/24"]
  }

  tags {
    Name          = "vpc-tier2-elb_sg"
    Resource      = "SG"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}
