terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.9"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_eks_pod_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS EKS Pod"

  chart {
    name = "Number of Running Pods"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.namespace_number_of_running_pods_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Number of Running Pods"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.service_number_of_running_pods_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "CPU Reserved Capacity"
    rank = "18"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_cpu_reserved_capacity_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "CPU Reserved Capacity"
    rank = "19"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_cpu_reserved_capacity_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "CPU Reserved Capacity"
    rank = "20"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_cpu_reserved_capacity_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "CPU Reserved Capacity"
    rank = "21"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_cpu_reserved_capacity_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "CPU Utilization over Pod Limit"
    rank = "22"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_cpu_utilization_over_pod_limit_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "CPU Utilization over Pod Limit"
    rank = "23"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_cpu_utilization_over_pod_limit_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "CPU Utilization over Pod Limit"
    rank = "24"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_cpu_utilization_over_pod_limit_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "CPU Utilization"
    rank = "25"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_cpu_utilization_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "CPU Utilization"
    rank = "26"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_cpu_utilization_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "CPU Utilization"
    rank = "27"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_cpu_utilization_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "POD Memory Utilization"
    rank = "28"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_memory_utilization_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Memory Utilization"
    rank = "29"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_memory_utilization_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Memory Utilization"
    rank = "30"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_memory_utilization_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Memory Utilization over Pod Limit"
    rank = "31"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_memory_utilization_over_pod_limit_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Memory Utilization over Pod Limit"
    rank = "32"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_memory_utilization_over_pod_limit_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Memory Utilization over Pod Limit"
    rank = "33"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_memory_utilization_over_pod_limit_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Number of Container Restarts"
    rank = "34"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.pod_number_of_container_restarts_sum | delta | group_by [], sum"
    }

  }

}
