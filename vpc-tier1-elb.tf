# Create internet facing lb for eb subnet
resource "aws_elb" "web" {
  name               = "vpc-tier1-elb"
  availability_zones = ["us-east-1b"]
  subnets            = ["${aws_subnet.tier1-sub.id}"]
  security_groups    = ["${aws_security_group.web.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  instances = ["${aws_instance.web.*.id}"]

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 5
  }

  tags {
    Name          = "vpc-tier1-elb"
    Resource      = "ELB"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}
