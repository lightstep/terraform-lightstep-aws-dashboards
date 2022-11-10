output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_metric_dashboard.aws_route53_dashboard.id}"
  description = "ROUTE53 Dashboard URL"
}