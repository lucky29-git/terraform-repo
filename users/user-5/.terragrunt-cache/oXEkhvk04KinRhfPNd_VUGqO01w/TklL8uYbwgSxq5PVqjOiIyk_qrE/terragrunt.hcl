generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "google" {
  project = var.project
  region  = var.region
  zone    = var.zone
}
EOF
}

terraform {
  source = "../../modules/google_storage_bucket"
}

inputs = {
    project = "nemesh-playground"
    buckets=[
        {
            bucket_name="user5-bucketttttt1tt",
            bucket_location="us-central1",
        },
        {
            bucket_name="user5-bucketttttt2",
            labels= {
                team="devopssssssss"
            }
        }
    ]
}
