terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.76.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_cloudtrail_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS CloudTrail"

  chart {
    name = "Units Count"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.cloudtrail.units_sum | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "Data Count"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.cloudtrail.total_data_retained_sum | delta | group_by [], sum
EOT
    }

  }

}
