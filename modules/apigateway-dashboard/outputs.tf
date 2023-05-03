output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_apigateway_dashboard.id}"
  description = "SNS Dashboard URL"
}