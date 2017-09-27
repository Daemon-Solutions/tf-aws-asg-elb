// Global Configuration
variable "name" {
  description = "The desired name for the Autoscaling Group. Will also be added as the value for the 'Name' tag on resources created by this module"
  type = "string"
}

variable "owner" {
  description = "This will become the value for the 'Owner' tag on resources created by this module"
  type = "string"
}

variable "envname" {
  description = "This will become the value for the 'Environment' tag on resources created by this module"
  type = "string"
}

variable "service" {
  description = "The host portion of the DNS records associated with this ELB, also the value for the 'Service' tag on resources created by this module"
  type = "string"
}

// DNS Variables
variable "elb_dns" {
  description = "The count of how many ELB DNS records to create"
  type = "string"
  default = "0"
}

variable "route53_zone_id" {
  description = "The r53 zone ID in which to create DNS records"
  type = "string"
}

variable "domain" {
  description = "The domain name to specify for ELB DNS records"
  type = "string"
  default = "example.com"
}

// ELB Configuration Variables
variable "availability_zones" {
  description = "A list of availability zones to span instances across"
  type = "list"
  default = ["eu-west1-b", "eu-west1-c", "eu-west1-d"]
}

variable "elb_subnets" {
  description = "A list of subnet IDs to attach to the ELB"
  type = "list"
  default = []
}

variable "elb_security_groups" {
  desription = "A list of security group IDs to assign to the ELB. Only valid if creating an ELB within a VPC"
  type = "list"
  default = []
}

variable "elb_port" {
  desription = "The port for your ELB to listen on"
  type = "string"
  default = "80"
}

variable "elb_proto" {
  desription = "The protocol for your ELB to listen on"
  type = "string"
  default = "http"
}

variable "backend_target" {
  desription = "The target of the back end healthcheck"
  type = "string"
  default = "HTTP:80/"
}

variable "backend_port" {
  desription = "The port that the ELB will route backend traffic on"
  type = "string"
  default = "80"
}

variable "backend_proto" {
  desription = "The protocol that the ELB will route backend traffic on"
  type = "string"
  default = "http"
}

variable "ssl_cert_id" {
  desription = "The ARN of a TLS certificate you have uploaded to AWS IAM. Only valid for protocols HTTPS or SSL"
  type = "string"
  default = ""
}

variable "elb_port2" { 
  desription = "The second port for your ELB to listen on"
  type = "string"
  default = "443" 
}

variable "elb_proto2" { 
  desription = "The second protocol for your ELB to listen on"
  default = "http"
  type = "string"
}

variable "backend_port2" { 
  desription = "The second port that the ELB will route backend traffic on"
  type = "string"
  default = "80"
}

variable "backend_proto2" {
  desription = "The second protocol that the ELB will route backend traffic on"
  type = "string"
  default = "http"
}

variable "ssl_cert_id2" {
  desription = "The ARN of a TLS certificate you have uploaded to AWS IAM to secure secondary traffic. Only valid for protocols HTTPS or SSL"
  type = "string"
  default = ""
}

variable "cross_zone" {
  desription = "Enables cross-zone load balancing on your ELB"
  type = "string"
  default = true
}

variable "idle_timeout" {
  desription = "The time in seconds that a connection is allowed to be idle"
  type = "string"
  default = 60
}

variable "internal" {
  desription = "If true, ELB will be an internal ELB"
  type = "string"
  default = false
}

variable "elb_log_bucket" {
  desription = "Name of the S3 bucket to store ELB logs in"
  type = "string"
  default = ""
}

variable "log_s3prefix" {
  desription = "The location inside the s3 bucket to store the logs"
  type = "string"
  default = "ELB"
}

variable "log_interval" {
  desription = "The log publishing interval in minutes"
  type = "string"
  default = "60"
}

// Launch Configuration Variables
variable "iam_instance_profile" {
  description = "The IAM instance profile to associate with launched instances"
  type = "string"
  default = ""
}

variable "key_name" {
  description = "The key pair name that should be used for the ASG launched instances"
  type = "string"
}

variable "ami_id" {
  description = "The AMI used to create ASG instances"
  type = "string"
}

variable "security_groups" {
  description = "A list of associated security group IDS"
  type = "list"
  default = []
}

variable "root_dev_type" {
  description = "EBS storage type to allocate to launched instances"
  type = "string"
  default = "gp2"
}

variable "root_dev_size" {
  description = "EBS storage size to allocate to launched instances"
  type = "string"
  default = "10"
}

variable "instance_type" {
  description = "The instance type for the ASG to create"
  type = "string"
  default = "t2.micro"
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  type = "string"
  default = ""
}

variable "associate_public_ip_address" {
  description = "Associate a public ip address with an ASG launched instance"
  type = "string"
  default = false
}

variable "detailed_monitoring" {
  description = "Enables/disables detailed monitoring"
  type = "string"
  default = false
}

// Auto-Scaling Group
variable "subnets" {
  description = "A list of subnet IDs to launch resources in"
  type = "list"
}

variable "asg_min" {
  description = "The minimum size of the Autoscale Group"
  type = "string"
  default = 1
}

variable "asg_max" {
  description = "The maximum size of the Autoscale Group"
  type = "string"
  default = 1
}

variable "health_check_type" { 
  description = "This value controls how health checking is done"
  type = "string"
  default = "ELB"
}

variable "health_check_grace_period" {
  description = "Time (seconds) after instance comes into service before checking health"
  type = "string"
  default = 300
}
