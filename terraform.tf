terraform {
  backend "gcs" {
    bucket  = "ashanaakh-platform-terraform-state"
    prefix  = "terraform/state"
  }
}

provider "google" {
  credentials = "${file("~/safe/ashanaakh-dev.json")}"
  project     = "ashanaakh-dev"
  region      = "us-east1"
}