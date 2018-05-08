resource "google_compute_address" "dev" {
  name = "ashanaakh-dev-ip"
}

resource "google_compute_instance" "development" {
  name         = "ashanaakh-dev"
  project      = "${var.project}"
  machine_type = "f1-micro"
  zone         = "us-east1-b"

  allow_stopping_for_update = true

  tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
      size  = "${var.disk_size}"
    }
  }

  metadata_startup_script = "echo 'test' > /test.txt"

  network_interface {
    network = "${var.network}"
    access_config {
      nat_ip = "${google_compute_address.dev.address}"
    }
  }
}