resource "google_sql_database" "mydatabase" {
  name     = var.db_name
  instance = var.db_instance
}