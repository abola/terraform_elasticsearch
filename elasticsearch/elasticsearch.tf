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
    image = "centos-7"
  }
}

network_interface {
   network = "default"
   access_config {}
}
service_account {
scopes = ["userinfo-email", "compute-ro", "storage-ro"]
}
metadata_startup_script = <<SCRIPT
yum update -y
yum install -y docker
yum install -y docker-ce
systemctl enable docker
systemctl start docker
docker pull docker.elastic.co/elasticsearch/elasticsearch:6.5.4
docker pull docker.elastic.co/kibana/kibana:6.5.4
docker pull grafana/grafana
docker run --name elasticsearch -p 9200:9200 -p 9300:9300 -d -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:6.5.4
docker run --name kibana -p 5601:5601 -d --link elasticsearch:elasticsearch -e "ELASTICSEARCH_URL=http://elasticsearch:9200" docker.elastic.co/kibana/kibana:6.5.4
docker run --name grafana -p 3000:3000 -d -e "GF_SECURITY_ADMIN_PASSWORD=secret" grafana/grafana
SCRIPT
}
