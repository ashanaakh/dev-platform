terraform {
  backend "gcs" {
    bucket  = "ashanaakh-platform-terraform-state"
    prefix  = "terraform/state"
  }
}

provider "google" {
  credentials = "${file("~/safe/ashanaakh-dev.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}