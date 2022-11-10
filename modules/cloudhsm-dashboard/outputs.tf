output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_metric_dashboard.aws_cloudhsm_dashboard.id}"
  description = "CLOUDHSM Dashboard URL"
}
