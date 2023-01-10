terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.10"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_cloudtrail_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS CloudTrail"

  chart {
    name = "Units Count"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudtrail.units_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Data Count"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudtrail.total_data_retained_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}
