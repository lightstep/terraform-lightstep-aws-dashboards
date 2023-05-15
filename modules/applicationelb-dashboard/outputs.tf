output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_applicationelb_dashboard.id}"
  description = "Application ELB Dashboard URL"
}
