resource "google_storage_bucket" "mybucket" {
  for_each = { for b in var.buckets : b.bucket_name => b }
  name     = each.value.bucket_name
  location = coalesce(each.value.bucket_location, "us-central1")
  storage_class = each.value.storage_class
  force_destroy = each.value.force_destroy
  labels = each.value.labels
  public_access_prevention = each.value.public_access_prevention
}