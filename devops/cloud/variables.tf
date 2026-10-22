variable "project_id" {
  description = "ID del progetto GCP"
  type        = string
}

variable "region" {
  description = "Regione GCP per le risorse"
  type        = string
}

variable "resource_prefix" {
  description = "Prefisso per i nomi delle risorse"
  type        = string
}

variable "container_image" {
  description = "us-docker.pkg.dev/cloudrun/container/hello"
  type        = string
  default     = "us-docker.pkg.dev/cloudrun/container/hello"
}

