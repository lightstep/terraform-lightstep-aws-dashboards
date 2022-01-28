terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = ">= 1.51.2"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_lambda_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS Lambda"

  chart {
    name = "Duration"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.lambda.duration_max"
      timeseries_operator = "last"

      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Concurrent Executions"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.lambda.invocations_count"
      timeseries_operator = "delta"

      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Errors"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.lambda.errors_max"
      timeseries_operator = "last"

      group_by {
        aggregation_method = "avg"
        keys               = []
      }

    }

  }

  chart {
    name = "Throttles"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.lambda.throttles_max"
      timeseries_operator = "last"

      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Concurrent Executions"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.lambda.concurrent_executions_count"
      timeseries_operator = "delta"

      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.lambda.unreserved_concurrent_executions_count"
      timeseries_operator = "delta"

      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}
