#################################################
# Health Check
#################################################

resource "google_compute_health_check" "http" {
  name    = "${var.name}-hc"
  project = var.project_id

  http_health_check {
    request_path = "/"
    port         = 80
  }
}

#################################################
# Backend Service
#################################################

resource "google_compute_backend_service" "backend" {
  name          = "${var.name}-backend"
  project       = var.project_id
  protocol      = "HTTP"
  load_balancing_scheme = "EXTERNAL"

  health_checks = [google_compute_health_check.http.id]

  backend {
    group = var.instance_group
  }
}

#################################################
# URL Map
#################################################

resource "google_compute_url_map" "url_map" {
  name            = "${var.name}-url-map"
  project         = var.project_id
  default_service = google_compute_backend_service.backend.id
}

#################################################
# HTTP Proxy
#################################################

resource "google_compute_target_http_proxy" "proxy" {
  name    = "${var.name}-proxy"
  project = var.project_id
  url_map = google_compute_url_map.url_map.id
}

#################################################
# Forwarding Rule
#################################################

resource "google_compute_global_forwarding_rule" "forwarding_rule" {
  name       = "${var.name}-fw-rule"
  project    = var.project_id
  target     = google_compute_target_http_proxy.proxy.id
  port_range = "80"
}
