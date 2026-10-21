variable "project_id" {
  description = "ID del progetto GCP"
  type        = string
}

variable "region" {
  description = "Regione GCP in cui creare le risorse"
  type        = string
}

variable "resource_prefix" {
  description = "Prefisso usato per i nomi delle risorse"
  type        = string
}

locals {
  services = [
    "run.googleapis.com",                  # Cloud Run API
    "iam.googleapis.com",                  # IAM API
    "artifactregistry.googleapis.com",     # Artifact Registry API
    "aiplatform.googleapis.com",           # Vertex AI API (Gemini)
    "cloudresourcemanager.googleapis.com"  # Necessario per ruoli IAM
  ]
}