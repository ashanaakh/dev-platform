resource "google_dns_managed_zone" "dev_zone" {
  count       = "${var.create_domain}"
  name        = "${replace(var.domain, ".", "-")}"
  description = "Zone managed by terraform"
  domain      = "${var.domain}."
}

resource "google_dns_record_set" "all_record_set" {
  count        = "${var.create_domain}"
  name         = "*.${google_dns_managed_zone.dev_zone.domain}"
  managed_zone = "${google_dns_managed_zone.dev_zone.name}"
  type         = "A"
  ttl          = "300"

  rrdatas = ["${google_compute_address.dev.address}"]
}

resource "google_dns_record_set" "root_record_set" {
  count        = "${var.create_domain}"
  name         = "${google_dns_managed_zone.dev_zone.domain}"
  managed_zone = "${google_dns_managed_zone.dev_zone.name}"
  type         = "A"
  ttl          = "300"

  rrdatas = ["${google_compute_address.dev.address}"]
}
