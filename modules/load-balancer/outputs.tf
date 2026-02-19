output "lb_ip_address" {
  value = google_compute_global_forwarding_rule.forwarding_rule.ip_address
}
