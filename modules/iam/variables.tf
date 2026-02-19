variable "project_id" {
  type = string
}

variable "service_accounts" {
  type = list(object({
    name        = string
    display_name= string
  }))
  default = []
}

variable "roles_to_assign" {
  type = list(object({
    service_account_email = string
    roles                 = list(string)
  }))
  default = []
}
