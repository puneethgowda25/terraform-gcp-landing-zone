resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  project  = var.project_id
  location = var.region

  network    = var.network_id
  subnetwork = var.subnet_ids[0] # default subnet for simplicity

  remove_default_node_pool = true
  initial_node_count       = 1

  ip_allocation_policy {
    # use_ip_aliases = true
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-nodepool"
  cluster    = google_container_cluster.primary.name
  project    = var.project_id
  location   = var.region
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
