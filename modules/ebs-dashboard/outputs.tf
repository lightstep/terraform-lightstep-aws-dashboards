output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_dashboard.aws_ebs_dashboard.id}"
  description = "OpenTelemetry AWS EBS Dashboard URL"
}
