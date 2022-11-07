terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.60.2"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_cloudfront_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS CloudFront"

  chart {
    name = "Requests"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudfront.requests_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DistributionId", ]
      }

    }

  }

  chart {
    name = "4 xx Error Rate"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudfront.4_xx_error_rate_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DistributionId", ]
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudfront.5_xx_error_rate_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DistributionId", ]
      }

    }

  }

  chart {
    name = "Bytes Downloaded"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudfront.bytes_downloaded_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DistributionId", ]
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudfront.bytes_uploaded_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DistributionId", ]
      }

    }

  }

}
