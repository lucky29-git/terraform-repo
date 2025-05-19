terraform {
    source = "../../modules/google_storage_bucket"
}

inputs = {
    
    bucket_name = "user-2-bucket"
    bucket_location = "us-central1"
}