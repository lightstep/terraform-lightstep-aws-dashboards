output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_dashboard.aws_mks_topic_dashboard.id}"
  description = "MSK Topic Dashboard URL"
}
