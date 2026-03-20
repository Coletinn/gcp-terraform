resource "google_compute_firewall" "allow_http_ssh" {
  name    = "allow-http-and-ssh"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["22", "80"]
  }

  target_tags   = ["http-server"]
  source_ranges = ["0.0.0.0/0"]
}