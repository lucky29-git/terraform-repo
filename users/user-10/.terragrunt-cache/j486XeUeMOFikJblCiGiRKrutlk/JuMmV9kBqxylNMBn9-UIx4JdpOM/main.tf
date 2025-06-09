module "google_storage_bucket" {
  source = "C:/Lucky/Coding/APT-4/terraform-repo/modules/google_storage_bucket"
  buckets = [
    {"bucket_name": "creatingnewbucketjustfortestinghaha"}
  ] 
}

variable "project" {
  type = string
}
variable "region" {
  type = string
}
variable "zone" {
  type = string
}