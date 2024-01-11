terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.86.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_athena_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS Athena"
  dashboard_description = "Monitor AWS Athena with this dashboard."

  chart {
    name = "Total Execution Time"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.athena.total_execution_time_sum | delta | group_by [], sum;
  b = metric aws.athena.total_execution_time_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Processed Bytes"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.athena.processed_bytes_sum | delta | group_by [], sum;
  b = metric aws.athena.processed_bytes_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Engine Execution Time"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.athena.engine_execution_time_sum | delta | group_by [], sum;
  b = metric aws.athena.engine_execution_time_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Query Queue Time"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.athena.query_queue_time_sum | delta | group_by [], sum;
  b = metric aws.athena.query_queue_time_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Query Planning Time"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.athena.query_planning_time_sum | delta | group_by [], sum;
  b = metric aws.athena.query_planning_time_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Service Processing Time"
    rank = "5"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.athena.service_processing_time_sum | delta | group_by [], sum;
  b = metric aws.athena.service_processing_time_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

}
