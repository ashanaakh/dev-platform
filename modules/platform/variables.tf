variable "network" {
  type        = "string"
  default     = "default"
  description = "The name or self_link of the network to attach this interface to."
}

variable "zone" {
  type        = "string"
  default     = "us-east1-b"
  description = "The zone that the machine should be created in."
}

variable "disk_image" {
  type        = "string"
  description = ""
}

variable "disk_size" {
  type        = "string"
  default     = "30"
  description = "The image from which to initialize this disk."
}

variable "project" {
  type        = "string"
  description = "The ID of the project in which the resource belongs. If it is not provided, the provider project is used."
}

variable "vm_type" {
  type        = "string"
  default     = "f1-micro"
  description = "The machine type to create."
}

variable "vm_name" {
  type        = "string"
  default     = "dev"
  description = "A unique name for the resource, required by GCE. Changing this forces a new resource to be created."
}

variable "domain" {
  type        = "string"
  description = "DNS name. Used if create_domain is true."
}

variable "create_domain" {
  type        = "string"
  default     = true
  description = "Disable/Enadle Cloud DNS creation"
}

variable "user" {
  type        = "string"
  default     = "terraform"
  description = "A user name to ssh."
}

variable "email" {
  type        = "string"
  description = "An Email to get LetsEncrypt news about your ssl certificates."
}
