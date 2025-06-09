resource "google_storage_bucket" "mybucket" {
  for_each = { for b in var.buckets : b.bucket_name => b }
  name     = each.value.bucket_name
  location = coalesce(each.value.bucket_location, "us-central1")
  storage_class = each.value.storage_class
  force_destroy = each.value.force_destroy
  labels = each.value.labels
  public_access_prevention = each.value.public_access_prevention

  dynamic "website" {
    for_each = (try(each.value.website_main_page_suffix, null) != null || try(each.value.website_not_found_page, null) != null) ? [1] : []
    content {
      main_page_suffix = try(each.value.website_main_page_suffix, null)
      not_found_page   = try(each.value.website_not_found_page, null)
    }
  }
}

resource "google_storage_bucket_iam_member" "public" {
  for_each = { for b in var.buckets : b.bucket_name => b if try(b.make_public, false) }
  bucket = google_storage_bucket.mybucket[each.key].name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}