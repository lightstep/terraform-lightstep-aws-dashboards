output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_metric_dashboard.aws_inspector_dashboard.id}"
  description = "INSPECTOR Dashboard URL"
}
