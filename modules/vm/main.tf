#################################################
# Instance Template
#################################################

resource "google_compute_instance_template" "template" {
  name_prefix  = var.name_prefix
  machine_type = var.machine_type
  project      = var.project_id

  disk {
    source_image = var.image
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    access_config {}
  }

  service_account {
    email  = var.service_account_email
    scopes = ["cloud-platform"]
  }

  tags = var.tags
}

#################################################
# Managed Instance Group (Regional)
#################################################

resource "google_compute_region_instance_group_manager" "mig" {
  name               = "${var.name_prefix}-mig"
  region             = var.region
  project            = var.project_id
  base_instance_name = var.name_prefix

  version {
    instance_template = google_compute_instance_template.template.id
  }

  target_size = var.target_size
}
