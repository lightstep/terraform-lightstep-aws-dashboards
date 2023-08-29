output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.cloud_observability_project}/dashboard/${lightstep_dashboard.aws_elasticache_redis_dashboard.id}"
  description = "Elasticache Redis Dashboard URL"
}
