output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_metric_dashboard.aws_amplify_dashboard.id}"
  description = "Amplify Dashboard URL"
}
