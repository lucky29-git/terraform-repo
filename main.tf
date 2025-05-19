terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "6.8.0"
    }
  }
}

provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}

module "google_artifact_registry" {
  source = "./modules/google_artifact_registry_repository"
  repository_id = repository_id
  format = var.format
}

module "google_sql_database_instance" {
  source         = "./modules/google_sql_database_instance"
  instance_name  = var.instance_name
  instance_version = var.instance_version
  instance_region  = var.instance_region
  instance_tier    = var.instance_tier
}

module "google_sql_database" {
  source      = "./modules/google_sql_database"
  db_name     = var.db_name
  db_instance = var.db_instance
}
