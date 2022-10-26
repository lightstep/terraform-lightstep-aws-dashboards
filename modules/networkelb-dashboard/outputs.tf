output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_metric_dashboard.aws_networkelb_dashboard.id}"
  description = "NETWORKELB Dashboard URL"
}
