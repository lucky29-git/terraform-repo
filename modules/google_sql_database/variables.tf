variable "database" {
  description = "List of databases to create."
  type = list(object({
    name          = string
    instance_name = string
    charset       = optional(string, "UTF8")
    collation     = optional(string, "en_US.UTF8")
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