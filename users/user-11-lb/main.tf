variable "project" {
  type = string
}
variable "region" {
  type = string
}
variable "zone" {
  type = string
}

# 1. Create a storage bucket for static site
module "static_site_bucket" {
  source  = "C:/Lucky/Coding/APT-4/terraform-repo/modules/google_storage_bucket"
  project = var.project
  region  = var.region
  zone    = var.zone
  buckets = [
    {
      bucket_name = "user-11-lb-static-site"
      bucket_location = var.region
      labels = {
        purpose = "static-site"
      }
      make_public = true
      website_main_page_suffix = "index.html"
      website_not_found_page = "404.html"
    }
  ]
}

# 2. Create a load balancer that routes to the bucket
module "static_site_lb" {
  source  = "C:/Lucky/Coding/APT-4/terraform-repo/modules/google_load_balancer"
  project = var.project
  region  = var.region
  zone    = var.zone
  load_balancers = [
    {
      name                = "user-11-lb"
      backend_type        = "bucket"
      backend_bucket_name = module.static_site_bucket.bucket_names["user-11-lb-static-site"]
      protocol            = "HTTP"
      port_range          = "80"
    }
  ]
}