output "dashboard_url" {
  value       = "https://app.lightstep.com/${var.lightstep_project}/dashboard/${lightstep_dashboard.aws_eks_pod_dashboard.id}"
  description = "EKS POD Dashboard URL"
}
