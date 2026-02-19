output "instance_name" {
  value = google_sql_database_instance.db.name
}

output "connection_name" {
  value = google_sql_database_instance.db.connection_name
}
