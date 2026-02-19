# Create service accounts
resource "google_service_account" "accounts" {
  for_each     = { for sa in var.service_accounts : sa.name => sa }
  account_id   = each.value.name
  display_name = each.value.display_name
  project      = var.project_id
}

# Assign IAM roles
resource "google_project_iam_member" "sa_roles" {
  for_each = {
    for r in var.roles_to_assign :
    "${r.service_account_email}-${join("-", r.roles)}" => r
  }

  project = var.project_id
  role    = each.value.roles[0]  # can iterate if multiple roles
  member  = "serviceAccount:${each.value.service_account_email}"
}
