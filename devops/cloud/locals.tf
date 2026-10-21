locals {
  services = [
    "run.googleapis.com",                  # Cloud Run API
    "iam.googleapis.com",                  # IAM API
    "artifactregistry.googleapis.com",     # Artifact Registry API
    "aiplatform.googleapis.com",           # Vertex AI API (Gemini)
    "cloudresourcemanager.googleapis.com"  # Necessario per ruoli IAM
  ]
}