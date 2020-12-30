provider "aws" {
  region     = "eu-west-2"
  access_key = "AKIAIDHLXIC5PHKA4HRA"
  secret_key = "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"
}

# Create a new load balancer ona aws
resource "aws_elb" "bar" {
  name               = var.elb_name
  availability_zones = var.elb_region


  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }


  cross_zone_load_balancing   = true
  idle_timeout                = var.timeout
  connection_draining         = true
  connection_draining_timeout = var.timeout

  tags = {
    Name = "foobar-terraform-elb"
  }
}