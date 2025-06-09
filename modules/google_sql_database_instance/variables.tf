variable "database_instance" {
  description = "List of database instances to create."
  type = list(object({
    name             = string
    instance_version = optional(string, "POSTGRES_15")
    region           = optional(string, "us-central1")
    tier             = optional(string, "db-f1-micro")
  }))
}

variable "project" {
  type = string
  default = "nemesh-playground"
}
variable "region" {
  type = string
  default = "us-central1"
}
variable "zone" {
  type = string
  default = "us-central1-c"
}