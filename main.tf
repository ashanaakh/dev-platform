resource "google_compute_address" "dev" {
  name = "ashanaakh-dev-ip"
}

resource "google_compute_instance" "dev" {
  name         = "${var.vm_name}"
  machine_type = "${var.vm_type}"
  zone         = "${var.region}-b"

  allow_stopping_for_update = true

  tags = ["http-server", "https-server"]

  metadata {
    sshKeys = "${var.user}:${file("~/.ssh/id_rsa.pub")}"
  }

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

  connection {
    type        = "ssh"
    user        = "${var.user}"
    timeout     = "2m"
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "file" {
    source      = "resources/docker-compose.yml"
    destination = "/tmp/docker-compose.yml"
  }

  provisioner "file" {
    source      = "resources/traefik.toml"
    destination = "/tmp/traefik.toml"
  }

  provisioner "file" {
    source      = "scripts/start.sh"
    destination = "/tmp/start.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/start.sh",
      "sudo /tmp/start.sh",
    ]
  }
}
