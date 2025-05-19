provider "google" {
  project = "terra-460008"
     zone = "us-central1"
     region = "us-central1-c"
}
     
resource "google_storage_bucket" "mybucket" {
  name = var.bucket_name
  location = var.bucket_location
}