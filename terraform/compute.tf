resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  depends_on = [
    google_project_iam_member.cloudbuild_compute_admin,
    google_project_service.compute_api
  ]

  tags = ["http-server"]

  boot_disk {
    initialize_params {
      image = "cos-cloud/cos-stable"
      size  = 30
      type  = "pd-standard"
    }
  }

  service_account {
    email  = "${data.google_project.project.number}-compute@developer.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  metadata = {
    gce-container-declaration = <<-EOT
      spec:
        containers:
          - name: flask-app
            image: us-central1-docker.pkg.dev/${var.project_id}/flask-terraform/flask-app:latest
            ports:
              - containerPort: 5000
        restartPolicy: Always
    EOT
  }

  network_interface {
    network = "default"
    access_config {
      network_tier = "STANDARD"
    }
  }

  labels = local.common_tags
}
