variable "project" {
  default = "terra-460008"
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
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

variable "bucket_name" {
  type = string
  description = "Name of the bucket"
}

variable "bucket_location" {
  description = "Location of the GCS bucket"
  type        = string
  default     = "US"
}

variable "instance_name" {
  type = string
}

variable "instance_version" {
  default = "POSTGRES_15"
}

variable "instance_region" {
  default = "us-central1"
}

variable "instance_tier" {
  default = "db-f1-micro"
}

variable "db_name" {
  type = string
}

variable "instance" {
  type = string
}

variable "db_instance" {
  type = string
  description = "The name of the Cloud SQL instance to use for the database."
}