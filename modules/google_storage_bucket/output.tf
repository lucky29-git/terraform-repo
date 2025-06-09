output "bucket_names" {
  description = "The names of the created GCS buckets"
  value       = { for k, b in google_storage_bucket.mybucket : k => b.name }
}