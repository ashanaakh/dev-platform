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

variable "create_domain" {
  type = "string"
}

variable "domain" {
  type = "string"
}

variable "email" {
  type = "string"
}

terraform {
  backend "gcs" {
    bucket = "ashanaakh-platform-terraform-state"
    prefix = "terraform/state"
  }
}

provider "google" {
  credentials = "${file("~/safe/${var.project}.json")}"
  project     = "${var.project}"
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
