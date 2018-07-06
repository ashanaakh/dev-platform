variable "network" {
  type = "string"
}

variable "region" {
  type = "string"
}

variable "disk_image" {
  type = "string"
}

variable "disk_size" {
  type    = "string"
  default = "10"
}

variable "project" {
  type = "string"
}

variable "vm_name" {
  type = "string"
}

variable "vm_type" {
  type    = "string"
  default = "f1-micro"
}

variable "dns_name" {
  type = "string"
}

variable "user" {
  type = "string"
}

variable "email" {
  type = "string"
}

module "platform" {
  source     = "platform/"
  network    = "${var.network}"
  region     = "${var.region}"
  disk_image = "${var.disk_image}"
  disk_size  = "${var.disk_image}"
  project    = "${var.project}"
  vm_type    = "${var.vm_type}"
  vm_name    = "${var.vm_name}"
  dns_name   = "${var.dns_name}"
  user       = "${var.user}"
  email      = "${var.email}"
}
