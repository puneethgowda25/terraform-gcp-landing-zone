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

# VM variables

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

# firwall variables
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

