output "cloud_run_url" {
  description = "L'URL pubblico generato per il servizio Cloud Run"
  value       = google_cloud_run_v2_service.default.uri
}

output "artifact_registry_url" {
  description = "L'URL del repository Docker su Artifact Registry"
  value       = "${var.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.docker_repo.repository_id}"
}