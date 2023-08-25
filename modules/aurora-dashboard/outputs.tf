output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_dashboard.aws_aurora_dashboard.id}"
  description = "Aurora Dashboard URL"
}
