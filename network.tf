resource "google_dns_managed_zone" "dev_zone" {
  name        = "${replace(var.dns_name, ".", "-")}"
  description = "Zone managed by terraform for ${var.project} project"
  dns_name    = "${var.dns_name}."
}

resource "google_dns_record_set" "dev_recor_set" {
  name         = "dev.${google_dns_managed_zone.dev_zone.dns_name}"
  managed_zone = "${google_dns_managed_zone.dev_zone.name}"
  type         = "A"
  ttl          = "300"

  rrdatas = ["${google_compute_address.dev.address}"]
}
