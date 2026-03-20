locals {
  service_name = "devops-lab"
  common_tags  = {
    owner      = "admin"
    managed_by = "terraform"
    project    = var.project_id
  }
}

resource "google_project_service" "compute_api" {
  project = var.project_id
  service = "compute.googleapis.com"

  disable_on_destroy = false
}