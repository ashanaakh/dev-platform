resource "google_compute_address" "dev" {
  name = "ashanaakh-dev-ip"
}

resource "google_compute_instance" "dev" {
  name         = "${var.vm_name}"
  machine_type = "${var.vm_type}"
  zone         = "${var.region}-b"

  allow_stopping_for_update = true

  tags = ["http-server", "https-server"]

  boot_disk {
    initialize_params {
      image = "${var.disk_image}"
      size  = "${var.disk_size}"
    }
  }

  network_interface {
    network = "${var.network}"

    access_config {
      nat_ip = "${google_compute_address.dev.address}"
    }
  }
}
