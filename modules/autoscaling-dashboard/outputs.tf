output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_autoscaling_dashboard.id}"
  description = "AutoScaling Dashboard URL"
}
