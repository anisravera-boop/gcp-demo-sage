resource "google_storage_bucket" "sage_docs" {
  name                        = "${var.resource_prefix}-sage-docs"
  location                    = var.region
  project                     = var.project_id
  force_destroy               = true
  uniform_bucket_level_access = true
}
