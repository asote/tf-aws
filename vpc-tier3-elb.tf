# Create interal lb for sql subnet
resource "aws_elb" "sql" {
  name = "vpc-tier3-elb"

  #availability_zones = ["us-east-1b"]
  internal        = true
  subnets         = ["${aws_subnet.tier3-sub.id}"]
  security_groups = ["${aws_security_group.tier3-elb.id}"]

  listener {
    instance_port     = 1433
    instance_protocol = "tcp"
    lb_port           = 1433
    lb_protocol       = "tcp"
  }

  instances = ["${aws_instance.sql.*.id}"]

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "TCP:1433"
    interval            = 5
  }

  tags {
    Name          = "vpc-tier3-elb"
    Resource      = "ELB"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}
