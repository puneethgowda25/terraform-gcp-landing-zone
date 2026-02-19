# Create VPC
resource "google_compute_network" "vpc" {
  name                    = var.network_name
  project                 = var.project_ids
  auto_create_subnetworks = false
  routing_mode            = "REGIONAL"
}

# Create Subnets
resource "google_compute_subnetwork" "subnets" {
  for_each = { for s in var.subnet_configs : s.name => s }

  name          = each.value.name
  ip_cidr_range = each.value.ip_cidr_range
  region        = var.region
  network       = google_compute_network.vpc.id
  project       = var.project_ids
}
