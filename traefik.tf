data "template_file" "traefik" {
  template = "${file("resources/traefik.toml.tpl")}"

  vars {
    domain = "dev.${var.dns_name}"
    email  = "${var.email}"
  }
}
