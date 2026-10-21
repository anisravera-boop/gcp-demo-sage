resource "google_artifact_registry_repository" "docker_repo" {
  project       = var.project_id
  location      = var.region
  repository_id = "${var.resource_prefix}-repo"
  description   = "Repository Docker per il servizio Cloud Run"
  format        = "DOCKER"

  depends_on = [google_project_service.enabled_apis]
}