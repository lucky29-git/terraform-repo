terraform {
    source = "../../modules/google_storage_bucket"
}

inputs = {
    bucket_name = "user-1-bucket"
    bucket_location = "us-central1"
}