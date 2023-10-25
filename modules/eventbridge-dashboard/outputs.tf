output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_eventbridge_dashboard.id}"
  description = "AWS EventBridge Dashboard URL"
}
