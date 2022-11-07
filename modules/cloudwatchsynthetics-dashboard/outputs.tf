output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_metric_dashboard.aws_cloudwatchsynthetics_dashboard.id}"
  description = "CLOUDWATCHSYNTHETICS Dashboard URL"
}
