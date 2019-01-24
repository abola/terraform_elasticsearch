#####################################################################
# To Provision FireWall rule
#####################################################################
resource "google_compute_firewall" "www" {
  name = "firewall-allow-elasticsearch"
  network = "default"

  allow {
    protocol = "tcp"
    ports = ["9200","9300","5601","3000"]
  }

  source_ranges = ["0.0.0.0/0"]
}
