# Project & Region
project_id   = "testing-puneeth"
region       = "asia-south1"

# VPC / Network
network_name = "dev-vpc"

subnet_configs = [
  {
    name          = "dev-subnet-1"
    ip_cidr_range = "10.0.1.0/24"
  }
  ,
  {
    name          = "dev-subnet-2"
    ip_cidr_range = "10.0.2.0/24"
  }
]

# VM / Managed Instance Group
vm_name_prefix  = "dev-app"
vm_machine_type = "e2-medium"
vm_image        = "projects/debian-cloud/global/images/family/debian-11"
vm_target_size  = 3

# Firewall: Allow HTTP from public
firewall_name          = "dev-allow-http"
firewall_ports         = ["80"]
firewall_source_ranges = ["0.0.0.0/0"]
firewall_target_tags   = ["http-server"]

# Firewall: Allow GCP Load Balancer Health Checks
firewall_hc_name          = "dev-allow-hc"
firewall_hc_ports         = ["80"]
firewall_hc_source_ranges = ["130.211.0.0/22","35.191.0.0/16"]
firewall_hc_target_tags   = ["http-server"]

# Load Balancer
lb_name = "dev-app-lb"
lb_port = 80
