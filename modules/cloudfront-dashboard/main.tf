terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.87.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_cloudfront_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS CloudFront"
  dashboard_description = "Monitor AWS CloudFront with this dashboard."

  chart {
    name = "Requests / TotalErrorRate"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.cloudfront.requests_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.cloudfront.total_error_rate_sum | reduce sum | group_by [], sum;
  b = metric aws.cloudfront.total_error_rate_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "4xxErrorRate / 5xxErrorRate"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.cloudfront.4xx_error_rate_sum | reduce sum | group_by [], sum;
  b = metric aws.cloudfront.4xx_error_rate_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.cloudfront.5xx_error_rate_sum | reduce sum | group_by [], sum;
  b = metric aws.cloudfront.5xx_error_rate_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "BytesDownloaded / BytesUploaded"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.cloudfront.bytes_downloaded_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.cloudfront.bytes_uploaded_sum | delta | group_by [], sum
EOT
    }

  }

}

