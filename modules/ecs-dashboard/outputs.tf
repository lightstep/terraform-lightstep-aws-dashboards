output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_dashboard.aws_ecs_dashboard.id}"
  description = "ECS Dashboard URL"
}
