resource "google_dns_record_set" "dev" {
  name = "dev.${google_dns_managed_zone.ashanaakh-me.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = "${google_dns_managed_zone.ashanaakh-me.name}"

  rrdatas = ["${google_compute_instance.dev.network_interface.0.access_config.0.nat_ip}"]
}

resource "google_dns_managed_zone" "ashanaakh-me" {
  name     = "ashanaakh-me-zone"
  dns_name = "ashanaakh.me."
}

