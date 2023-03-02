output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_metric_dashboard.aws_aurora_dashboard.id}"
  description = "Aurora Dashboard URL"
}