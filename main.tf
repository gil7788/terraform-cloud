provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_project_service" "cloud_resource_manager_api" {
  service = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = var.disable_apis_on_destroy
}

resource "google_project_service" "compute_api" {
  depends_on = [google_project_service.cloud_resource_manager_api]
  service = "compute.googleapis.com"
  // Optionally, you can disable services on destroy.
  disable_on_destroy = var.disable_apis_on_destroy
}

resource "google_compute_instance" "default" {
  depends_on= [google_project_service.compute_api]
  name         = var.instance_name
  machine_type = var.instance_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  tags = ["terraform-provisioned"]
}

