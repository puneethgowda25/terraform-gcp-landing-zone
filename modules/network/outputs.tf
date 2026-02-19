output "vpc_id" {
  value = google_compute_network.vpc.id
}

output "subnet_ids" {
  value = [for s in google_compute_subnetwork.subnets : s.id]
}
