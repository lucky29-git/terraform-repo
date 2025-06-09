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

module "google_storage_bucket" {
  source = "./modules/google_storage_bucket"
  project = var.project
  buckets = var.buckets
}

module "database_instance" {
  source         = "./modules/google_sql_database_instance"
  database_instance = var.db_instance
}

module "database" {
  source   = "./modules/google_sql_database"
  database = var.database
  # instance_depends_on = module.database_instance
}

