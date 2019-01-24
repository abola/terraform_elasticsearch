#####################################################################
# To provision elasticsearch
#####################################################################
resource "google_compute_instance" "elasticsearch" {
name = "elasticsearch"
machine_type = "n1-standard-2"
zone = "asia-east1-a"
tags = ["elasticsearch"]
boot_disk {
  initialize_params {
    image = "elasticsearch-6"
  }
}

network_interface {
   network = "default"
   access_config {}
}
service_account {
scopes = ["userinfo-email", "compute-ro", "storage-ro"]
}

}
