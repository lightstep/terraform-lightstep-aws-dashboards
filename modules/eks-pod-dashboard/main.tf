terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.91.1"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_eks_pod_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS EKS Pod"
  dashboard_description = "Monitor AWS EKS Pods with this summary dashboard."

  chart {
    name = "Number of Running Pods"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.eks.namespace_number_of_running_pods_sum | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "Number of Container Restarts"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.eks.pod_number_of_container_restarts_sum | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "CPU"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.eks.pod_cpu_reserved_capacity_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.eks.pod_cpu_utilization_over_pod_limit_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.eks.pod_cpu_utilization_sum | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "Memory"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.eks.pod_memory_utilization_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.eks.pod_memory_utilization_over_pod_limit_sum | delta | group_by [], sum
EOT
    }

  }

}
