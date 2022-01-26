output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_metric_dashboard.aws_ecs_dashboard.id}"
  description = "ECS Dashboard URL"
}