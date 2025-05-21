
resource "google_storage_bucket" "mybucket" {
  name = var.bucket_name
  location = var.bucket_location
}