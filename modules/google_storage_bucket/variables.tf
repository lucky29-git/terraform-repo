variable "bucket_name" {
  type = string
  description = "Name of the bucket"
}

variable "bucket_location" {
  description = "Location of the GCS bucket"
  type        = string
  default     = "US"
}