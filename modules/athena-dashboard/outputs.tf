output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_metric_dashboard.aws_athena_dashboard.id}"
  description = "ATHENA Dashboard URL"
}