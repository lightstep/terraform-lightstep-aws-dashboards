output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_metric_dashboard.aws_elasticache_redis_dashboard.id}"
  description = "Elasticache Redis Dashboard URL"
}