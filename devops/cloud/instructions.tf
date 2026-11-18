resource "google_storage_bucket" "sage_instructions" {
  name                        = "${local.resource_prefix_effective}-instructions"
  project                     = var.project_id
  location                    = var.region
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
  force_destroy               = true
  depends_on                  = [google_project_service.apis]
}

resource "google_storage_bucket_object" "istruzioni" {
  bucket       = google_storage_bucket.sage_instructions.name
  name         = "istruzioni.md"
  source       = "${path.module}/istruzioni.md"
  content_type = "text/markdown; charset=utf-8"
}

resource "google_storage_bucket_iam_member" "sage_run_instructions_viewer" {
  bucket = google_storage_bucket.sage_instructions.name
  role   = "roles/storage.objectViewer"
  member = "serviceAccount:${google_service_account.sage_run.email}"
}
