resource "google_artifact_registry_repository" "flask-terraform" {
  location      = "us-central1"
  repository_id = "flask-terraform"
  description   = "Docker repository for Flask App"
  format        = "DOCKER"

  cleanup_policy_dry_run = false
  cleanup_policies {
    id     = "delete-old-images"
    action = "DELETE"
    condition {
      tag_state    = "ANY"
      older_than   = "1209600s"
    }
  }
}