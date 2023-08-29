output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_dashboard.aws_ses_dashboard.id}"
  description = "Simple Email Service Dashboard URL"
}
