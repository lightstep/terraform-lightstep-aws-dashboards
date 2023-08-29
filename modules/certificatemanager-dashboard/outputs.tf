output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_dashboard.aws_certificatemanager_dashboard.id}"
  description = "Certificate Manaager Dashboard URL"
}
