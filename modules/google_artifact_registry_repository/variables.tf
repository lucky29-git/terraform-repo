variable "repository_id" {
  type = string
}

variable "format" {
  type = string
  default = "DOCKER"
}

variable "location" {
  type    = string
  default = "us-central1"
}

variable "description" {
  type    = string
  default = "Managed by my application"
}