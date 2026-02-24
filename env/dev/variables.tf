variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "asia-south1"
}

# Network variables
variable "network_name" {
  type    = string
  default = "dev-vpc"
}

variable "subnet_configs" {
  description = "List of subnet configurations"
  type = list(object({
    name          = string
    ip_cidr_range = string
  }))
}

# # VM variables
variable "vm_name_prefix" {
  type = string
}

variable "vm_machine_type" {
  type = string
}

variable "vm_image" {
  type = string
}

variable "vm_target_size" {
  type = number
}

# # Firewall variables: public HTTP
variable "firewall_name" {
  type = string
}

variable "firewall_ports" {
  type = list(string)
}

variable "firewall_source_ranges" {
  type = list(string)
}

variable "firewall_target_tags" {
  type = list(string)
}

# # Firewall variables: GCP Health Checks
variable "firewall_hc_name" {
  type = string
}

variable "firewall_hc_ports" {
  type = list(string)
}

variable "firewall_hc_source_ranges" {
  type = list(string)
}

variable "firewall_hc_target_tags" {
  type = list(string)
}

# # Load balancer variables
variable "lb_name" {
  type = string
}

variable "lb_port" {
  type    = number
  default = 80
}

# # Link to MIG instance group
variable "lb_instance_group" {
  description = "Self-link of the Managed Instance Group (MIG) to attach the LB backend"
  type        = string
  default     = null
}
