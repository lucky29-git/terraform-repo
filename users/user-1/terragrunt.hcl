terraform {
    source = "../../modules/google_storage_bucket"
}

inputs = {
    project = "terra-460008"
    zone = "us-central1"
    region = "us-central1-c"
    bucket_name = "user-1-bucket"
    bucket_location = "us-central1"
}