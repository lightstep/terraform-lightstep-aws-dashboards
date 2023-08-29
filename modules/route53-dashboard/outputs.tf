output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_dashboard.aws_route53_dashboard.id}"
  description = "ROUTE53 Dashboard URL"
}
