output "ip" {
  value = "${google_compute_address.dev.address}"
}