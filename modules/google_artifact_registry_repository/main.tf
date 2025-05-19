resource "google_artifact_registry_repository" "myartifactregistry" {
   repository_id = var.repository_id
   format = var.format
   location = var.location
   description = var.description
}