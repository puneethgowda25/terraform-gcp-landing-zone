module "network" {
  source         = "../../modules/network"
  project_ids    = var.project_id
  region         = var.region
  network_name   = var.network_name
  subnet_configs = var.subnet_configs
}

# module "allow_http" {
#   source        = "../../modules/firewall"
#   name          = var.firewall_name
#   project_id    = var.project_id
#   network       = module.network.network_name
#   protocol      = "tcp"
#   ports         = var.firewall_ports
#   source_ranges = var.firewall_source_ranges
#   target_tags   = var.firewall_target_tags
# }

# module "vm" {
#   source                = "../../modules/vm"
#   project_id            = var.project_id
#   region                = var.region
#   name_prefix           = var.vm_name_prefix
#   machine_type          = var.vm_machine_type
#   image                 = var.vm_image
#   network               = module.network.network_name
#   subnetwork            = module.network.subnet_names[0]
#   service_account_email = "default"
#   tags                  = ["http-server"]
#   target_size           = var.vm_target_size
#   startup_script        = file("${path.module}/scripts/startup.sh")
# }

# module "lb" {
#   source         = "../../modules/load-balancer"
#   project_id     = var.project_id
#   name           = var.lb_name
#   instance_group = module.vm.mig_id 
#   port           = var.lb_port
# }

# module "allow_healthcheck" {
#   source        = "../../modules/firewall"
#   name          = var.firewall_hc_name
#   project_id    = var.project_id
#   network       = module.network.network_name
#   protocol      = "tcp"
#   ports         = var.firewall_hc_ports
#   source_ranges = var.firewall_hc_source_ranges
#   target_tags   = var.firewall_hc_target_tags
# }
