output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_cloudhsm_dashboard.id}"
  description = "CLOUDHSM Dashboard URL"
}
