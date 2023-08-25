output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_dashboard.aws_step_functions_dashboard.id}"
  description = "AWS Step Functions Dashboard URL"
}
