output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_metric_dashboard.aws_app_elb_dashboard.id}"
  description = "RDS Dashboard URL"
}
