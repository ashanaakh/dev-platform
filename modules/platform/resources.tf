data "template_file" "traefik" {
  template = "${file("resources/traefik.toml.tpl")}"

  vars {
    domain = "${var.domain}"
    email  = "${var.email}"
  }
}

data "template_file" "docker_compose" {
  template = "${file("resources/docker-compose.yml.tpl")}"

  vars {
    domain = "${var.domain}"
  }
}
