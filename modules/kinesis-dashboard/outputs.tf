output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_kinesis_dashboard.id}"
  description = "Kinesis Dashboard URL"
}