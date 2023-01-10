terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.10"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_chatbot_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS Chatbot"

  chart {
    name = "Events"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.chatbot.events_throttled_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.chatbot.events_processed_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "count"
        keys               = []
      }

    }

  }

  chart {
    name = "Unsupported Events"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.chatbot.unsupported_events_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Message Delivery"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.chatbot.message_delivery_success_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.chatbot.message_delivery_failure_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}
