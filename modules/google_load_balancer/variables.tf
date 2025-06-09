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
variable "load_balancers" {
  description = "List of load balancer configs"
  type = list(object({
    name                  = string
    backend_type          = string # 'instance_group', 'bucket', or 'sql_database'
    backend_group         = optional(string) # Instance group or NEG self_link
    backend_bucket_name   = optional(string) # For bucket backend
    backend_database      = optional(object({
      name          = string
      instance_name = string
    })) # For sql_database backend
    protocol              = optional(string, "HTTP")
    timeout_sec           = optional(number, 30)
    port_name             = optional(string, "http")
    port_range            = optional(string, "80")
    load_balancing_scheme = optional(string, "EXTERNAL")
  }))
}