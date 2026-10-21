resource "google_cloud_run_v2_service" "sage_backend" {
  name     = "${var.resource_prefix}-sage-backend"
  location = var.region
  project  = var.project_id

  template {
    service_account = google_service_account.cloud_run_sa.email

    containers {
      # Placeholder: da sostituire con l'immagine reale su Artifact Registry
      image = "us-docker.pkg.dev/cloudrun/container/hello" 

      resources {
        limits = {
          cpu    = "1000m"
          memory = "2Gi"
        }
      }
    }
  }

  depends_on = [
    google_project_service.enabled_apis,
    google_project_iam_member.vertex_ai_user
  ]
}