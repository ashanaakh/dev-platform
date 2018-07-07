data "template_file" "traefik" {
  template = "${file("resources/traefik.toml.tpl")}"

  vars {
    domain = "dev.${var.domain}"
    email  = "${var.email}"
  }
}

data "template_file" "docker_compose" {
  template = "${file("resources/docker_compose.yml.tpl")}"

  vars {
    domain = "${var.domain}"
  }
}
