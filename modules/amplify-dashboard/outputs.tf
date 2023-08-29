output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_dashboard.aws_amplify_dashboard.id}"
  description = "Amplify Dashboard URL"
}
