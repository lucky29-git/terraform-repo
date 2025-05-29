variable "buckets" {
  description = "A list of buckets to create"
  type = list(object({
    bucket_name = string
    bucket_location = optional(string)
    storage_class = optional(string)
    force_destroy = optional(bool)
    labels = optional(map(string))
    public_access_prevention = optional(string)
  }))
}

variable "project" {
  type = string
  default = "nemesh-playground"
}
variable "region" {
  type = string
  default = "us-central1"
}
variable "zone" {
  type = string
  default = "us-central1-c"
}