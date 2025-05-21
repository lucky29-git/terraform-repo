variable "db_name" {
  type = string
}

variable "db_instance" {
  type = string
}

variable "project" {
  type = string
  default = "terra-460008"
}
variable "region" {
  type = string
  default = "us-central1"
}
variable "zone" {
  type = string
  default = "us-central1-c"
}