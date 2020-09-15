provider "google" {
  credentials = file(var.gke_keyfile)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}

provider "google-beta" {
  credentials = file(var.gke_keyfile)
  project     = var.project_id
  region      = var.region
  zone        = var.zone
}