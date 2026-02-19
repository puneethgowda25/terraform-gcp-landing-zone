variable "project_id" {
  type = string
}

variable "region" {
  type    = string
  default = "asia-south1"
}

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
