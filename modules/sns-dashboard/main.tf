terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.93.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_sns_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS SNS"
  dashboard_description = "Monitor AWS SNS performance with this summary dashboard."

  chart {
    name = "Messages Published"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
  metric aws.sns.number_of_messages_published_count | delta | group_by [], sum

EOT
    }

  }

  chart {
    name = "Publish Size (Max)"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
  metric aws.sns.publish_size_max | latest | group_by [], sum

EOT
    }

  }

}
