variable "instance_name" {
  type = string
}

variable "instance_version" {
  default = "POSTGRES_15"
}

variable "instance_region" {
  default = "us-central1"
}

variable "instance_tier" {
  default = "db-f1-micro"
}

variable "project" { type = string }
variable "region"  { type = string }
variable "zone"    { type = string }