resource "google_compute_address" "dev" {
  name = "${var.project}-ip"
}

resource "google_compute_instance" "dev" {
  name         = "${var.instance_name}"
  machine_type = "${var.instance_type}"
  zone         = "${var.zone}"

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
    source      = "${data.template_file.docker_compose.rendered}"
    destination = "/tmp/docker-compose.yml"
  }

  provisioner "file" {
    content     = "${data.template_file.traefik.rendered}"
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
