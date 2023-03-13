output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_metric_dashboard.aws_step_functions_dashboard.id}"
  description = "AWS Step Functions Dashboard URL"
}
