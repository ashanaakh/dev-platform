output "ip" {
  value       = "${google_compute_address.dev.address}"
  description = "The IPv4 address of dev instnace"
}

output "name_servers" {
  value       = "${google_dns_managed_zone.dev_zone.name_servers}"
  description = "List of randomly assigned google name servers"
}
