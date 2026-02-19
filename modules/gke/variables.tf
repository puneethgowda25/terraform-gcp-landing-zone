variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "network_id" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "node_count" {
  type        = number
  default     = 3
  description = "Number of nodes in the default node pool"
}

variable "machine_type" {
  type        = string
  default     = "e2-medium"
}
