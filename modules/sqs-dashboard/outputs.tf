output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_sqs_dashboard.id}"
  description = "SQS Dashboard URL"
}