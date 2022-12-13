terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.60"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_amplify_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS Amplify"

  chart {
    name = "Requests Count"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.amplify.requests_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Bytes Requests"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.amplify.bytes_downloaded_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.amplify.bytes_uploaded_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Errors"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.amplify.4xx_errors_rate_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.amplify.5xx_errors_rate_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Lantency"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.amplify.latency_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}
