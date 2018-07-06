output "ip" {
  value = "${google_compute_address.dev.address}"
}

output "name_servers" {
  value = "${google_dns_managed_zone.dev_zone.name_servers}"
}
