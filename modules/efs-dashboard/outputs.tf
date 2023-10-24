output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_efs_dashboard.id}"
  description = "EFS Dashboard URL"
}
