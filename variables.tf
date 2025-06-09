variable "project" {
  type = string
  description = "GCP project ID"
}

variable "region" {
  type = string
  description = "GCP region"
}

variable "zone" {
  type = string
  description = "GCP zone"
}

variable "repository_id" {
  description = "Artifact Registry repository ID"
  type        = string
}

variable "format" {
  description = "Artifact Registry format"
  type        = string
  default     = "DOCKER"
}

variable "buckets" {
  type = list(object({
    bucket_name = string
    bucket_location = string
    labels = map(string)
  }))
}

variable "bucket_name" {
  type = string
  description = "Name of the bucket"
}

variable "bucket_location" {
  description = "Location of the GCS bucket"
  type        = string
  default     = "US"
}

variable "db_instance" {
  description = "List of database instances to create."
  type = list(object({
    name             = string
    instance_version = string  # optional
    region           = string  # optional
    tier             = string  # optional
  }))
}

variable "database" {
  description = "List of databases to create."
  type = list(object({
    name          = string
    instance_name = string
    charset       = string  # optional
    collation     = string  # optional
  }))
  
}