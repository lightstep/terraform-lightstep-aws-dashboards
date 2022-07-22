terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.60.2"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_aurora_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS Aurora"

  chart {
    name = "CPU Utilization"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.cpu_utilization_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }
}