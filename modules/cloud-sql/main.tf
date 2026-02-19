#################################################
# Cloud SQL Instance Module
#################################################

resource "google_sql_database_instance" "db" {
  name             = var.db_name
  database_version = var.database_version
  region           = var.region
  project          = var.project_id

  settings {
    tier = var.tier

    ip_configuration {
      ipv4_enabled = true
    }
  }

  deletion_protection = false
}
