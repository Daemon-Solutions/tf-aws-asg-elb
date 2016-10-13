# tf-aws-asg-elb-log
This module is based on `tf-aws-asg-elb-log`.  
Auto-scaling with ELB + S3 Logging - Terraform Module

Main difference is that this module allows to provide S3 bucket ID for ELB
logging

## Variables
* `name` -
* `owner` -
* `envname` -
* `service` - used for tagging and for creating R53 ELB alias
* `elb_dns - 0|1 (default: 0)
* `route53_zone_id` -
* `domain` -
* `availability_zones` -
* `elb_subnets` -
* `elb_security_groups` -
* `elb_port` - ELB listiner port (default: 80)
* `elb_proto` - ELB listiner protocol (default: http)
* `backend_target` -
* `backend_port` -
* `backend_proto` -
* `ssl_cert_id` - default: empty string
* `elb_port2` -
* `elb_proto2` -
* `backend_port2` -
* `backend_proto2` -
* `ssl_cert_id2` - default: empty string
* `cross_zone` - default: true
* `idle_timeout` - default: 60
* `internal` - default: false
* `elb_log_bucket` - default: empty string
* `log_s3prefix` - default: ELB
* `log_interval` -
* `iam_instance_profile` -
* `key_name` -
* `ami_id` -
* `security_groups` -
* `root_dev_type` - default: gp2
* `root_dev_size` - default: 10
* `instance_type` - default: t2.micro
* `user_data` -
* `associate_public_ip_address` - default: false
* `detailed_monitoring` - default: false
* `subnets` -
* `asg_min` - default: 0
* `asg_max` - default: 1
* `health_check_type` - default: ELB
* `health_check_grace_period` - default: 300

## Outputs
* `launch_config_id`
* `asg_id`
* `asg_name`
