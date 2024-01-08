terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.86.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_lambda_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS Lambda"
  dashboard_description = "Monitor AWS Lambda with this summary dashboard."

  chart {
    name = "Duration"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.lambda.duration_max | latest | group_by [], sum
EOT
    }

  }

  chart {
    name = "Concurrent Executions"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.lambda.invocations_count | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "Errors"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.lambda.errors_max | latest | group_by [], mean
EOT
    }

  }

  chart {
    name = "Throttles"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.lambda.throttles_max | latest | group_by [], sum
EOT
    }

  }

  chart {
    name = "Concurrent Executions"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.lambda.concurrent_executions_count | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.lambda.unreserved_concurrent_executions_count | delta | group_by [], sum
EOT
    }

  }

}
