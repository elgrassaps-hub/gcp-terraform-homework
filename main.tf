provider "google" {
  project = var.project_id
  region  = var.region
  zone    = var.zone
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "homework_bucket" {
  name                        = "${var.project_id}-hw-bucket-${random_id.suffix.hex}"
  location                    = var.region
  uniform_bucket_level_access = true
  force_destroy               = true
  labels                      = { purpose = "homework" }
}

resource "google_bigquery_dataset" "homework_dataset" {
  dataset_id                 = "homework_dataset"
  location                   = "EU"
  delete_contents_on_destroy = true
  labels                     = { purpose = "homework" }
}

resource "google_compute_instance" "homework_vm" {
  name         = "homework-vm"
  machine_type = "e2-micro"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    network = "default"
  }

  labels = { purpose = "homework" }
}
