terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.89.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_chatbot_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS Chatbot"
  dashboard_description = "Monitor AWS Chatbot with this dashboard."

  chart {
    name = "Events"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.chatbot.events_throttled_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.chatbot.events_processed_sum | delta | group_by [], count
EOT
    }
  }

  chart {
    name = "Unsupported Events"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.chatbot.unsupported_events_sum | delta | group_by [], sum
EOT
    }
  }

  chart {
    name = "Message Delivery"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.chatbot.message_delivery_success_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.chatbot.message_delivery_failure_sum | delta | group_by [], sum
EOT
    }
  }
}
