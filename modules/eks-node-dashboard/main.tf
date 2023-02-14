terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.9"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_eks_node_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS EKS Node"

  chart {
    name = "Cluster Node"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.cluster_failed_node_count | delta | group_by [], sum"
    }

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.cluster_node_count | delta | group_by [], sum"
    }

  }

  chart {
    name = "CPU"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_cpu_limit_sum | delta | group_by [], sum"
    }

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_cpu_reserved_capacity_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "CPU Usage Total"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_cpu_usage_total_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "CPU Utilization"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_cpu_utilization_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Filesystem Utilization"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_filesystem_utilization_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Memory"
    rank = "5"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_memory_utilization_sum | delta | group_by [], sum"
    }

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_memory_reserved_capacity_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Number of Running Containers"
    rank = "6"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_number_of_running_containers_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Number of Running PODS"
    rank = "7"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_number_of_running_pods_sum | delta | group_by [], sum"
    }

  }

}
