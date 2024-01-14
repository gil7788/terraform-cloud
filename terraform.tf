terraform {
  cloud {
    organization = "My-TFC-Tutorial"

    workspaces {
      name = "new-workspace"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.11.0"
    }
  }

  required_version = "~> 1.2"
}

