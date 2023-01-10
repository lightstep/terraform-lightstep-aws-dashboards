output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_ebs_dashboard.id}"
  description = "EBS Dashboard URL"
}
