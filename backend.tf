terraform {
  backend "gcs" {
    bucket = "project-534688f2-c3a9-4bff-95a-tfstate-001"
    prefix = "terraform/state"
  }
}
