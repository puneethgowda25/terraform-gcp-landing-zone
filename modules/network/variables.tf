variable "project_ids" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  description = "GCP region"
}

variable "network_name" {
  type        = string
  description = "Name of the VPC network"
}

variable "subnet_configs" {
  type = list(object({
    name          = string
    ip_cidr_range = string
  }))
  description = "List of subnets with name and IP CIDR range"
}
