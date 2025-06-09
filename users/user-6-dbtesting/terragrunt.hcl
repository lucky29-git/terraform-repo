generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "google" {
  project = "nemesh-playground"
  region  = var.region
  zone    = var.zone
}
EOF
}

terraform {
  source = "./" # Adjust path as needed to root
}

inputs = {
  project = "nemesh-playground"
  region  = "us-central1"
  zone    = "us-central1-c"
  database = [
    {
      name = "newdatabasereraerinasr"
      instance_name = "testinginstancenaya"
    },
    {
        name = "hahahdfadfasdfasdfadf"
        instance_name = "testinginstancenaya"
    }
]
}

