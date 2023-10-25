output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_chime_dashboard.id}"
  description = "Chime Dashboard URL"
}
