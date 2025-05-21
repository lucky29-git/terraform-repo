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
  source = "../../modules/google_sql_database_instance"
}

inputs = {
  project = "terra-460008"
  zone = "us-central1"
  region = "us-central1-c"
  instance_name    = "user3-instance"
  instance_version = "POSTGRES_15"
  instance_region  = "us-central1"
  instance_tier    = "db-f1-micro"
}
