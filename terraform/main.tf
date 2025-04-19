terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.30.0"
    }
  }
}

provider "google" {
    project = var.gcp_project_id
    region = var.gcp_region
    credentials = file("${path.module}/.gcp/credentials.json")
}

resource "google_compute_instance" "vm-easetravel-app" {
    name = var.gcp_vm_name
    machine_type = "n2d-standard-2"
    zone = var.gcp_zone

    boot_disk {
        initialize_params {
            image = "ubuntu-os-cloud/ubuntu-2004-lts"
            size = 40
        }
    }

    network_interface {
      network = "default"
      access_config {}
    }

    metadata_startup_script = file("${path.module}/scripts/install_app.sh")
    tags = ["accesseasytravelweb"]
}

resource "google_compute_firewall" "firewall-easetravel-app" {
    name = "accesseasytravel"
    network = "default"

    allow {
      protocol = "tcp"
      ports = ["8000-10000"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = ["accesseasytravelweb"]
}