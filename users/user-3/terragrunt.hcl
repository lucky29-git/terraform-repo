terraform {
  source = "../../modules/google_sql_database_instance"
}

inputs = {
  instance_name    = "user3-instance"
  instance_version = "POSTGRES_15"
  instance_region  = "us-central1"
  instance_tier    = "db-f1-micro"
}
