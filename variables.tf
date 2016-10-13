// Global Configuration
variable "name" {}

variable "owner" {}

variable "envname" {}

variable "service" {}

// DNS Variables
variable "elb_dns" {
  default = "0"
}

variable "route53_zone_id" {
  default = "changeme"
}

variable "domain" {
  default = "example.com"
}

// ELB Configuration Variables
variable "availability_zones" {}

variable "elb_subnets" {
  type = "list"
}

variable "elb_security_groups" {
  type = "list"
}

variable "elb_port" {
  default = "80"
}

variable "elb_proto" {
  default = "http"
}

variable "backend_target" {
  default = "HTTP:80/"
}

variable "backend_port" {
  default = "80"
}

variable "backend_proto" {
  default = "http"
}

variable "ssl_cert_id" {
  default = ""
}

variable "elb_port2" {
  default = "443"
}

variable "elb_proto2" {
  default = "http"
}

variable "backend_port2" {
  default = "80"
}

variable "backend_proto2" {
  default = "http"
}

variable "ssl_cert_id2" {
  default = ""
}

variable "cross_zone" {
  default = true
}

variable "idle_timeout" {
  default = 60
}

variable "internal" {
  default = false
}

variable "elb_log_bucket" {
  default = ""
}

variable "log_s3prefix" {
  default = "ELB"
}

variable "log_interval" {
  default = "60"
}

// Launch Configuration Variables
variable "iam_instance_profile" {}

variable "key_name" {}

variable "ami_id" {}

variable "security_groups" {
  type = "list"
}

variable "root_dev_type" {
  default = "gp2"
}

variable "root_dev_size" {
  default = "10"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "user_data" {
  description = "Content of user_data file"
}

variable "associate_public_ip_address" {
  default = false
}

variable "detailed_monitoring" {
  default = false
}

// Auto-Scaling Group
variable "subnets" {
  type = "list"
}

variable "asg_min" {
  default = 0
}

variable "asg_max" {
  default = 1
}

variable "health_check_type" {
  default = "ELB"
}

variable "health_check_grace_period" {
  default = 300
}
