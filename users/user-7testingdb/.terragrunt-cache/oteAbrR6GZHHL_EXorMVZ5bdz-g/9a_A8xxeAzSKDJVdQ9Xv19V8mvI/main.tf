


module "database" {
  source = "C:/Lucky/Coding/APT-4/terraform-repo/modules/google_sql_database"
  database = [
    { name = "testingdbuser88669", instance_name = "testinginstance" },
    { name = "testingdbuser776", instance_name = "testinginstance" },
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
