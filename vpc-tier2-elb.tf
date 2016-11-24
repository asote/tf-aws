# Create intenal lb for app subnet
resource "aws_elb" "app" {
  name = "vpc-tier2-elb"
  internal = true

  subnets         = ["${aws_subnet.tier2-sub.id}"]
  security_groups = ["${aws_security_group.app.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  instances = ["${aws_instance.app.*.id}"]

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 5
  }

  tags {
    Name          = "vpc-tier2-elb"
    Resource      = "ELB"
    ResourceGroup = "asotelo-tf-rgp"
    Ecosystem     = ""
    Application   = ""
    Environment   = ""
  }
}
