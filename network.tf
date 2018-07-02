resource "google_dns_record_set" "dev" {
  name = "dev.${google_dns_managed_zone.dev-zone.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${google_dns_managed_zone.dev-zone.name}"

  rrdatas = ["${google_compute_instance.dev.network_interface.0.access_config.0.nat_ip}"]
}

resource "google_dns_managed_zone" "dev-zone" {
  name     = "${replace(var.dns_name, ".", "-")}"
  dns_name = "${var.dns_name}."
}
