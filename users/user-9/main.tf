module "database_instance" {
  source = "C:/Lucky/Coding/APT-4/terraform-repo/modules/google_sql_database_instance"
  database_instance= [
    { name = "creatinginstancenewwww" }
  ]
}
module "database" {
  source = "C:/Lucky/Coding/APT-4/terraform-repo/modules/google_sql_database"
  
  database = [
    { name = "testingdbuser88669", instance_name = "creatinginstancenewwww" },
    { name = "testingdbuser776", instance_name = "creatinginstancenewwww" },
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
