terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.93.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_s3_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS S3"
  dashboard_description = "Monitor AWS S3 performance with this overview dashboard."

  chart {
    name = "Requests"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.s3.all_requests_max | latest | group_by [], sum

EOT
    }

  }

  chart {
    name = "Downloaded Bytes / Uploaded Bytes"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.s3.bytes_downloaded_max | latest | group_by [], sum

EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.s3.bytes_uploaded_max | latest | group_by [], sum

EOT
    }

  }

  chart {
    name = "Latency"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.s3.first_byte_latency_max | latest | group_by [], sum

EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.s3.total_request_latency_max | latest | group_by [], sum

EOT
    }

  }

  chart {
    name = "Errors"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.s3.5xx_errors_count | delta | group_by [], sum

EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.s3.4xx_errors_count | delta | group_by [], sum

EOT
    }

  }

}
