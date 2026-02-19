output "mig_name" {
  value = google_compute_region_instance_group_manager.mig.name
}

output "mig_id" {
  value = google_compute_region_instance_group_manager.mig.instance_group
}
