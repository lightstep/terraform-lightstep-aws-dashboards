output "lightstep_aws_ec2_dashboard_url" {
  value       = module.lightstep_ec2_dashboards.dashboard_url
  description = "Lightstep AWS EC2 Dashboard URL"
}
