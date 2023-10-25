output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_msk_dashboard.id}"
  description = "MSK Dashboard URL"
}
