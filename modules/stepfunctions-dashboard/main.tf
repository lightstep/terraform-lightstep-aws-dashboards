terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.89.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_step_functions_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS Step Functions"
  dashboard_description = "Monitor AWS Step Functions with this view of execution results."

  chart {
    name = "Executions Succeeded"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.states.executions_succeeded_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Execution Time"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.states.execution_time_sum | reduce sum | group_by [], sum;
  b = metric aws.states.execution_time_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0

EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.states.execution_time_max | reduce max | group_by [], max"
    }

  }

  chart {
    name = "Executions Started"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.states.executions_started_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Executions Failed"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.states.executions_failed_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Executions TimedOut"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.states.executions_timed_out_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Executions Aborted"
    rank = "5"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.states.executions_aborted_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Execution Throttled"
    rank = "6"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.states.execution_throttled_sum | delta | group_by [], sum"
    }

  }

}
