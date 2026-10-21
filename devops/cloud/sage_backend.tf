resource "google_cloud_run_v2_service" "sage_backend" {
  name     = "${var.resource_prefix}-sage-backend"
  
  location            = var.region
  project             = var.project_id

  ingress             = "INGRESS_TRAFFIC_ALL"
  # deletion_protection = false

  template {
    service_account = google_service_account.sage_run.email

    scaling {
      min_instance_count = 0
      max_instance_count = 1
    }

    containers {
      image = "us-docker.pkg.dev/cloudrun/container/hello" 

      ports {
        container_port = 8080
      }

      resources {
        limits = {
          cpu    = "1"
          memory = "2Gi"
        }
      }

      env {
        name  = "SAGE_RESOURCE_PREFIX"
        value = var.resource_prefix
      }
    }
  }

  # L'immagine reale è pubblicata dalla pipeline applicativa, non da Terraform.
  lifecycle {
    ignore_changes = [
      template[0].containers[0].image,
      client,
      client_version,
    ]
  }

  depends_on = [
    google_project_service.apis,
    google_project_iam_member.sage_run_vertex,
  ]
}