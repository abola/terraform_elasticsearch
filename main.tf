#####################################################################
# Modules
#####################################################################
module "elasticsearch" {
  source   = "./elasticsearch"
  project  = "${var.project}"
  region   = "${var.region}"
}
