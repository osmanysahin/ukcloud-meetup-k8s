resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = var.auto_create_subnetwork
}

resource "google_compute_health_check" "hc" {
  name               = "proxy-health-check"
  check_interval_sec = 1
  timeout_sec        = 1

  tcp_health_check {
    port = "80"
  }
}

resource "google_compute_region_backend_service" "backend" {
  name          = "compute-backend"
  region        = var.region
  health_checks = [google_compute_health_check.hc.id]
}

resource "google_compute_forwarding_rule" "default" {
  name     = "compute-forwarding-rule"
  region   = var.region

  load_balancing_scheme = "INTERNAL"
  backend_service       = google_compute_region_backend_service.backend.id
  all_ports             = true
  network               = google_compute_network.vpc.name
  subnetwork            = google_compute_subnetwork.subnet.name
}

resource "google_compute_route" "route-ilb" {
  name         = "route-ilb"
  dest_range   = "0.0.0.0/0"
  network      = google_compute_network.vpc.name
  next_hop_ilb = google_compute_forwarding_rule.default.id
  priority     = 2000
}

