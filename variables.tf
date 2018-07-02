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

variable "vm_type" {
  type    = "string"
  default = "f1-micro"
}

variable "vm_name" {
  type = "string"
}

variable "dns_name" {
  type = "string"
}
