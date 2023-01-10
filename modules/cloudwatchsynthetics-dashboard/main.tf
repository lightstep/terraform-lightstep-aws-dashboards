terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.1"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_cloudwatchsynthetics_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS CoudWatchSynthetics"

  chart {
    name = "Success Percent"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudwatchsynthetics.success_percent_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["CanaryName", ]
      }

    }

  }

  chart {
    name = "Failed"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudwatchsynthetics.failed_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["CanaryName", ]
      }

    }

  }

  chart {
    name = "Failed requests"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudwatchsynthetics.failed_requests_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["CanaryName", ]
      }

    }

  }

  chart {
    name = "2xx"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudwatchsynthetics.2xx_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["CanaryName", ]
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudwatchsynthetics.4xx_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["CanaryName", ]
      }

    }

    query {
      query_name = "c"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudwatchsynthetics.5xx_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["CanaryName", ]
      }

    }

  }

  chart {
    name = "Duration"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudwatchsynthetics.duration_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["CanaryName", ]
      }

    }

  }

}
