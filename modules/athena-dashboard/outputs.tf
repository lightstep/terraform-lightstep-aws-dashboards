output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_athena_dashboard.id}"
  description = "Athena Dashboard URL"
}
