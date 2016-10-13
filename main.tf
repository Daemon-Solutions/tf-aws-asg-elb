// Route53 Record
resource "aws_route53_record" "elb" {
  count   = "${var.elb_dns}"
  zone_id = "${var.route53_zone_id}"
  name    = "${var.service}.${var.domain}"
  type    = "A"

  alias {
    name                   = "${aws_elb.elb.dns_name}"
    zone_id                = "${aws_elb.elb.zone_id}"
    evaluate_target_health = true
  }
}

// ELB Configuration using above created bucket
resource "aws_elb" "elb" {
  subnets         = ["${var.elb_subnets}"]
  security_groups = ["${var.elb_security_groups}"]

  access_logs {
    bucket        = "${var.elb_log_bucket}"
    bucket_prefix = "${var.log_s3prefix}"
    interval      = "${var.log_interval}"
  }

  listener {
    instance_port      = "${var.backend_port}"
    instance_protocol  = "${var.backend_proto}"
    lb_port            = "${var.elb_port}"
    lb_protocol        = "${var.elb_proto}"
    ssl_certificate_id = "${var.ssl_cert_id}"
  }

  listener {
    instance_port      = "${var.backend_port2}"
    instance_protocol  = "${var.backend_proto2}"
    lb_port            = "${var.elb_port2}"
    lb_protocol        = "${var.elb_proto2}"
    ssl_certificate_id = "${var.ssl_cert_id2}"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "${var.backend_target}"
    interval            = 30
  }

  cross_zone_load_balancing = "${var.cross_zone}"
  idle_timeout              = "${var.idle_timeout}"
  internal                  = "${var.internal}"

  tags = {
    Name        = "${var.name}"
    Environment = "${var.envname}"
    Service     = "${var.service}"
  }
}

// Launch Configuration
resource "aws_launch_configuration" "lc" {
  lifecycle {
    create_before_destroy = true
  }

  security_groups = ["${var.security_groups}"]

  image_id                    = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  iam_instance_profile        = "${var.iam_instance_profile}"
  key_name                    = "${var.key_name}"
  user_data                   = "${var.user_data}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  enable_monitoring           = "${var.detailed_monitoring}"

  root_block_device {
    volume_type = "${var.root_dev_type}"
    volume_size = "${var.root_dev_size}"
  }
}

// Auto-Scaling Group Configuration
resource "aws_autoscaling_group" "asg" {
  name                = "${var.name}"
  availability_zones  = ["${split(",", var.availability_zones)}"]
  vpc_zone_identifier = ["${var.subnets}"]

  // Use the Name from the launch config created above
  launch_configuration = "${aws_launch_configuration.lc.name}"

  min_size = "${var.asg_min}"
  max_size = "${var.asg_max}"

  health_check_grace_period = "${var.health_check_grace_period}"
  health_check_type         = "${var.health_check_type}"
  load_balancers            = ["${aws_elb.elb.id}"]

  tag {
    key = "Name"

    value = "${var.name}"

    propagate_at_launch = true
  }

  tag {
    key = "Environment"

    value = "${var.envname}"

    propagate_at_launch = true
  }

  tag {
    key = "Service"

    value = "${var.service}"

    propagate_at_launch = true
  }

  tag {
    key = "owner"

    value = "${var.owner}"

    propagate_at_launch = true
  }
}
