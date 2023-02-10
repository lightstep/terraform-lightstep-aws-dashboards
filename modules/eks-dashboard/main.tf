terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.9"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_eks_dashboard" {
  project_name = var.lightstep_project
  dashboard_name = "AWS EKS"

  chart {
    name = "cluster failed node count"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.cluster_failed_node_count | delta | group_by [], sum"
    }

  }

  chart {
    name = "cluster node count"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.cluster_node_count | delta | group_by [], sum"
    }

  }

  chart {
    name = "namespace number of running pods"
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
    name = "service number of running pods"
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
    name = "node cpu limit"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_cpu_limit_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "node cpu reserved capacity"
    rank = "5"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_cpu_reserved_capacity_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "node cpu usage total"
    rank = "6"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_cpu_usage_total_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "node cpu usage total"
    rank = "7"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_cpu_usage_total_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "node cpu utilization"
    rank = "8"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_cpu_utilization_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "node cpu utilization"
    rank = "9"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_cpu_utilization_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "node filesystem utilization"
    rank = "10"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_filesystem_utilization_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "node filesystem utilization"
    rank = "11"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_filesystem_utilization_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "node memory utilization"
    rank = "12"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_memory_utilization_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "node memory reserved capacity"
    rank = "13"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_memory_reserved_capacity_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "node memory reserved capacity"
    rank = "14"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_memory_reserved_capacity_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "node memory utilization"
    rank = "15"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_memory_utilization_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "node number of running containers"
    rank = "16"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_number_of_running_containers_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "node number of running pods"
    rank = "17"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.eks.node_number_of_running_pods_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "pod cpu reserved capacity"
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
    name = "pod cpu reserved capacity"
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
    name = "pod cpu reserved capacity"
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
    name = "pod cpu reserved capacity"
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
    name = "pod cpu utilization over pod limit"
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
    name = "pod cpu utilization over pod limit"
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
    name = "pod cpu utilization over pod limit"
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
    name = "pod cpu utilization"
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
    name = "pod cpu utilization"
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
    name = "pod cpu utilization"
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
    name = "pod memory utilization"
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
    name = "pod memory utilization"
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
    name = "pod memory utilization"
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
    name = "pod memory utilization over pod limit"
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
    name = "pod memory utilization over pod limit"
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
    name = "pod memory utilization over pod limit"
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
    name = "pod number of container restarts"
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
