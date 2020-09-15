# Create Subnet

resource "google_compute_subnetwork" "subnet" {
  name          = var.gke_subnet_name
  ip_cidr_range = var.subnet_cidr
  network       = google_compute_network.vpc.name
  region        = var.region
}