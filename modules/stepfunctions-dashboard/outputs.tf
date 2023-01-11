output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_stepfunctions_dashboard.id}"
  description = "Step Functions Dashboard URL"
}
