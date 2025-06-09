
module "database_instance" {
  source = "C:/Lucky/Coding/APT-4/terraform-repo/modules/google_sql_database_instance"
  database_instance = [
    { name = "testinginstance" }
  ]
}

module "database" {
  source = "C:/Lucky/Coding/APT-4/terraform-repo/modules/google_sql_database"
  database = [
    { name = "testingdbuser6", instance_name = "testinginstance" }
  ]
}

variable "project" {
  type = string
}
variable "region" {
  type = string
}
variable "zone" {
  type = string
}
