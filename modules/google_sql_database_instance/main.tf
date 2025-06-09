resource "google_sql_database_instance" "mypostgresinstance" {
  for_each         = { for inst in var.database_instance : inst.name => inst }
  name             = each.value.name
  database_version = lookup(each.value, "instance_version", "POSTGRES_15")
  region           = lookup(each.value, "region", "us-central1")
  settings {
    tier = lookup(each.value, "tier", "db-f1-micro")
  }
}