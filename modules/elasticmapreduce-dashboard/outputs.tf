output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_dashboard.aws_elasticmapreduce_dashboard.id}"
  description = "Elastic Map Reduce Dashboard URL"
}
