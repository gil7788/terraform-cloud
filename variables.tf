# Config
# TODO Change region and zone to your region and zone, or to your desired region and zone.
variable "project" {}

variable "region" {
  description = "GCP region"
  default = "us-central1"
}

variable "zone" {
  description = "GCP zone"
  default = "us-central1-c"
}

# Resources
variable "instance_type" {
  description = "Type of GCE instance to provision"
  default     = "f1-micro"
}

variable "instance_name" {
  description = "GCE instance name"
  default     = "terraform-provisioned-instance"
}

# Permissions
variable "disable_apis_on_destroy" {}

