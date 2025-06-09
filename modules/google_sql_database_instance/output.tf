output "instance_names" {
  value = { for k, inst in google_sql_database_instance.mypostgresinstance : k => inst.name }
}