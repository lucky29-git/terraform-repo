resource "google_sql_database" "mydatabase" {
  for_each   = { for db in var.database : "${db.instance_name}.${db.name}" => db }
  name       = each.value.name
  instance   = each.value.instance_name
  charset    = lookup(each.value, "charset", "UTF8")
  collation  = lookup(each.value, "collation", "en_US.UTF8")
}