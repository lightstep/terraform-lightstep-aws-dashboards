output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_dashboard.aws_backup_dashboard.id}"
  description = "Backup Dashboard URL"
}
