output "lightstep_app_elb_dashboard_url" {
  value       = module.lightstep_app_elb_dashboard.dashboard_url
  description = "Lightstep AWS Application ELB Dashboard URL"
}