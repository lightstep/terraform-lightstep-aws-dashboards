terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.60"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_sns_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS SNS"

  chart {
    name = "Messages Published"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.sns.number_of_messages_published_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Publish Size (Max)"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.sns.publish_size_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}
