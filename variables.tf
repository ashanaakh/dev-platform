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

variable "machine_type" {
  type    = "string"
  default = "f1-micro"
}