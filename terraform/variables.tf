variable "instance_name" {
  description = "The name of the VM instance"
  type        = string
  default     = "terraform-micro-instance"
}

variable "project_id" {
  description = "The GCP Project ID"
  type        = string
  default     = "gcp-devops-490722"
}