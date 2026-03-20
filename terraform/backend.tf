terraform {
  backend "gcs" {
    bucket  = "gucoleto-gcp-devops-tf-state"
    prefix  = "terraform/state"
  }
}