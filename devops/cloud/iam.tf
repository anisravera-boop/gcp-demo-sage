resource "google_service_account" "cloud_run_sa" {
  project      = var.project_id
  account_id   = "${var.resource_prefix}-run"
  display_name = "Service Account per Cloud Run ${var.resource_prefix}"

  depends_on = [google_project_service.enabled_apis]
}

resource "google_project_iam_member" "vertex_ai_user" {
  project = var.project_id
  role    = "roles/aiplatform.user"
  member  = "serviceAccount:${google_service_account.cloud_run_sa.email}"
}