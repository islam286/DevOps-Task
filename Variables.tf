##################################################################################
# VARIABLES
##################################################################################

variable "region" {
  default = "us-east-1"
}

variable "subnet_count" {
  default = 2
}

variable "cidr_block" {
  default = "10.0.0.0/16"
}
variable "domain_name" {
  default = "the_required_domain_name"
}