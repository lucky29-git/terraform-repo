variable "bucket_name" {
  type = string
  description = "Name of the bucket"
}

variable "bucket_location" {
  description = "Location of the GCS bucket"
  type        = string
  default     = "US"
}
variable "project" {
  type = string
  default = "terra-460008"
}
variable "region" {
  type = string
  default = "us-central1"
}
variable "zone" {
  type = string
  default = "us-central1-c"
}