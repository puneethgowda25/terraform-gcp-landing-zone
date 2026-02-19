module "network" {
  source         = "../../modules/network"
  project_ids    = var.project_id
  region         = var.region
  network_name   = var.network_name
  subnet_configs = var.subnet_configs
}
