output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_dashboard.aws_cloudtrail_dashboard.id}"
  description = "CloudTrail Dashboard URL"
}
