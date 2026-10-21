resource "google_service_account" "sage_run" {
  project      = var.project_id
  account_id   = "${var.resource_prefix}-run"
  display_name = "Service Account per Cloud Run ${var.resource_prefix}"

  depends_on = [google_project_service.apis]
}

resource "google_project_iam_member" "sage_run_vertex" {
  project = var.project_id
  role    = "roles/aiplatform.user"
  member  = "serviceAccount:${google_service_account.sage_run.email}"
}