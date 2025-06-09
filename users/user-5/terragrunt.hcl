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
            bucket_name="user5-testingbuckhaha",
            bucket_location="us-central1",
        }
    ]
}
