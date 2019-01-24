#####################################################################
# Variables
#####################################################################
variable "username" {
  default = "admin"
}
variable "password" {}
variable "project" {}
variable "region" {}
#####################################################################
# Modules
#####################################################################
module "elasticsearch" {
  source = "./elasticsearch"
  project = "${var.project}"
 region = "${var.region}"
  username = "${var.username}"
  password = "${var.password}"
}
