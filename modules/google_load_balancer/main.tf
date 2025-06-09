resource "google_compute_global_address" "lb_ip" {
  for_each = { for lb in var.load_balancers : lb.name => lb }
  name     = "${each.value.name}-ip"
}

# Instance group/NEG backend
resource "google_compute_backend_service" "backend" {
  for_each = { for lb in var.load_balancers : lb.backend_type == "instance_group" ? lb.name : null => lb if lb.backend_type == "instance_group" }
  name     = "${each.value.name}-backend"
  protocol = lookup(each.value, "protocol", "HTTP")
  timeout_sec = lookup(each.value, "timeout_sec", 30)
  port_name = lookup(each.value, "port_name", "http")
  backend {
    group = each.value.backend_group
  }
}

# Bucket backend
resource "google_compute_backend_bucket" "backend_bucket" {
  for_each = { for lb in var.load_balancers : lb.backend_type == "bucket" ? lb.name : null => lb if lb.backend_type == "bucket" }
  name        = "${each.value.name}-backend-bucket"
  bucket_name = each.value.backend_bucket_name
  enable_cdn  = true
}

# Helper locals to select backend service or backend bucket
locals {
  backend_service_ids = { for k, v in google_compute_backend_service.backend : k => v.id }
  backend_bucket_ids  = { for k, v in google_compute_backend_bucket.backend_bucket : k => v.id }
}

# URL map: choose backend type
resource "google_compute_url_map" "url_map" {
  for_each = { for lb in var.load_balancers : lb.name => lb }
  name     = "${each.value.name}-url-map"
  default_service = (
    each.value.backend_type == "instance_group" ? local.backend_service_ids[each.key] :
    each.value.backend_type == "bucket" ? local.backend_bucket_ids[each.key] :
    null
  )
}

resource "google_compute_target_http_proxy" "http_proxy" {
  for_each = { for lb in var.load_balancers : lb.name => lb }
  name     = "${each.value.name}-http-proxy"
  url_map  = google_compute_url_map.url_map[each.key].id
}

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  for_each = { for lb in var.load_balancers : lb.name => lb }
  name                  = "${each.value.name}-fwd-rule"
  ip_address            = google_compute_global_address.lb_ip[each.key].address
  port_range            = lookup(each.value, "port_range", "80")
  target                = google_compute_target_http_proxy.http_proxy[each.key].id
  load_balancing_scheme = lookup(each.value, "load_balancing_scheme", "EXTERNAL")
}

# Output a note for sql_database backend (no real backend, just a demonstration)
resource "null_resource" "sql_database_note" {
  for_each = { for lb in var.load_balancers : lb.backend_type == "sql_database" ? lb.name : null => lb if lb.backend_type == "sql_database" }
  provisioner "local-exec" {
    command = "echo 'SQL Database backend for ${each.value.backend_database.name} on instance ${each.value.backend_database.instance_name} (not supported as HTTP backend)'"
  }
}
