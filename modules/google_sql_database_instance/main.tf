resource "google_sql_database_instance" "mypostgresinstance" {
  name             = var.instance_name
  database_version = var.instance_version
  region           = var.instance_region

  settings {
    tier = var.instance_tier
  }
}