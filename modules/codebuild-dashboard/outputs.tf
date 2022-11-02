output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_metric_dashboard.aws_codebuild_dashboard.id}"
  description = "CODEBUILD Dashboard URL"
}
