terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.60.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_s3_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS S3"

  chart {
    name = "Requests"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.s3.all_requests_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["BucketName", ]
      }

    }

  }

  chart {
    name = "Downloaded Bytes / Uploaded Bytes"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.s3.bytes_downloaded_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["BucketName", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.s3.bytes_uploaded_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["BucketName", ]
      }

    }

  }

  chart {
    name = "Latency"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.s3.first_byte_latency_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["BucketName", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.s3.total_request_latency_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["FilterId", ]
      }

    }

  }

  chart {
    name = "Errors"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.s3.5xx_errors_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["BucketName", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.s3.4xx_errors_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["BucketName", ]
      }

    }

  }

}
