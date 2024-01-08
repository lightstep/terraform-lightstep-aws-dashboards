terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.86.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_chime_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS Chime SDK"

  chart {
    name = "Attendee Authorization"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.chime.attendee_authorization_success_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.chime.attendee_authorization_error_sum | delta | group_by [], sum
EOT
    }
  }

  chart {
    name = "Attendee Audio Drops"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.chime.attendee_audio_drops_sum | delta | group_by [], sum
EOT
    }
  }

  chart {
    name = "Attendee Content Drops"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.chime.attendee_content_drops_sum | delta | group_by [], sum
EOT
    }
  }

  chart {
    name = "Meeting SQS Errors"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.chime.meeting_sqs_notification_errors_sum | delta | group_by [], sum
EOT
    }
  }

  chart {
    name = "Meeting SNS Errors"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.chime.meeting_sns_notification_errors_sum | delta | group_by [], sum
EOT
    }
  }
}