terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.51.6"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_ecs_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS ECS"

  chart {
    name = "CPU Utilization"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.ecs.cpu_utilization_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["ClusterName", ]
      }

    }

  }

  chart {
    name = "Memory Utilization"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.ecs.memory_utilization_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["ClusterName", ]
      }

    }

  }

  chart {
    name = "CPU Reservation"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.ecs.cpu_reservation_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["ClusterName", ]
      }

    }

  }

  chart {
    name = "Memory Reservation"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.ecs.memory_reservation_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}