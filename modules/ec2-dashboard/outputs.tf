output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_ec2_dashboard.id}"
  description = "EC2 Dashboard URL"
}
