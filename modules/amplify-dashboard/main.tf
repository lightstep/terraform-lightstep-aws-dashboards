terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.88.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_amplify_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS Amplify"
  dashboard_description = "Monitor AWS Amplify with this summary dashboard."

  chart {
    name = "Requests Count"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.amplify.requests_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Bytes Requests"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.amplify.bytes_downloaded_sum | delta | group_by [], sum"
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.amplify.bytes_uploaded_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Errors"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.amplify.4xx_errors_rate_sum | delta | group_by [], sum"
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.amplify.5xx_errors_rate_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Lantency"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.amplify.latency_max | latest | group_by [], sum"
    }

  }

}
