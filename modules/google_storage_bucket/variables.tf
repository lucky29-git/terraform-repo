variable "buckets" {
  description = "A list of buckets to create"
  type = list(object({
    bucket_name = string
    bucket_location = optional(string)
    storage_class = optional(string)
    force_destroy = optional(bool)
    labels = optional(map(string))
    public_access_prevention = optional(string)
    make_public = optional(bool)
    website_main_page_suffix = optional(string)
    website_not_found_page = optional(string)
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