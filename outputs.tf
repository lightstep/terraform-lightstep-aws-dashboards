output "lightstep_aws_ec2_dashboard_url" {
  value       = module.lightstep_ec2_dashboard.dashboard_url
  description = "Lightstep AWS EC2 Dashboard URL"
}

output "lightstep_aws_rds_dashboard_url" {
  value       = module.lightstep_rds_dashboard.dashboard_url
  description = "Lightstep AWS RDS Dashboard URL"
}

output "lightstep_app_elb_dashboard_url" {
  value       = module.lightstep_app_elb_dashboard.dashboard_url
  description = "Lightstep AWS Application ELB Dashboard URL"
}

output "lightstep_lambda_dashboard_url" {
  value       = module.lightstep_lambda_dashboard.dashboard_url
  description = "Lightstep AWS Lambda Dashboard URL"
}

output "lightstep_kinesis_dashboard_url" {
  value       = module.lightstep_kinesis_dashboard.dashboard_url
  description = "Lightstep AWS Kinesis Dashboard URL"
}