output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_redshift_dashboard.id}"
  description = "REDSHIFT Dashboard URL"
}