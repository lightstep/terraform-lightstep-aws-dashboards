terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.86.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_sqs_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS SQS"
  dashboard_description = "Monitor AWS SQS with this summary dashboard."

  chart {
    name = "Number of Messages Sent"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.sqs.number_of_messages_sent_count | delta | group_by [], sum

EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.sqs.number_of_messages_received_count | delta | group_by [], sum

EOT
    }

  }

  chart {
    name = "Approx Age of Oldest Message"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.sqs.approximate_age_of_oldest_message_max | latest | group_by [], sum

EOT
    }

  }

  chart {
    name = "Approx Number of Messages"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.sqs.approximate_number_of_messages_visible_count | rate | group_by [], sum

EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.sqs.approximate_number_of_messages_delayed_count | delta | group_by [], sum

EOT
    }

  }

  chart {
    name = "Number of Empty Receives"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.sqs.number_of_empty_receives_count | delta | group_by [], sum

EOT
    }

  }

  chart {
    name = "Sent Message Size"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.sqs.sent_message_size_max | latest | group_by [], sum

EOT
    }

  }

}
