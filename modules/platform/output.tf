output "ip" {
  value       = "${google_compute_address.dev.address}"
  description = "The IPv4 address of dev instnace"
}

