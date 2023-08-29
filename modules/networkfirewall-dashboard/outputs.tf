output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_dashboard.aws_networkfirewall_dashboard.id}"
  description = "Network Firewall Dashboard URL"
}
