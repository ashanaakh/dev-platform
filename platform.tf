variable "project" {
  type = "string"
}

variable "disk_image" {
  type = "string"
}

variable "vm_name" {
  type = "string"
}

variable "vm_type" {
  type    = "string"
  default = "f1-micro"
}

variable "domain" {
  type = "string"
}

variable "email" {
  type = "string"
}

module "platform" {
  source        = "modules/platform/"
  project       = "${var.project}"
  disk_image    = "${var.disk_image}"
  vm_type       = "${var.vm_type}"
  vm_name       = "${var.vm_name}"
  create_domain = "${var.create_domain}"
  domain        = "${var.domain}"
  email         = "${var.email}"
}
