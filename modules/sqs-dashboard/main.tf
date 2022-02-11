terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "1.60.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_sqs_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS SQS"

  chart {
    name = "Messages"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.sqs.number_of_messages_sent_count"
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

      metric              = "aws.sqs.number_of_messages_received_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "c"
      display    = "bar"
      hidden     = false

      metric              = "aws.sqs.number_of_messages_received_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Approx Age of Oldest Message"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.sqs.approximate_age_of_oldest_message_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Approx Number of Messages"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.sqs.approximate_number_of_messages_visible_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.sqs.approximate_number_of_messages_delayed_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Number of Empty Receives"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.sqs.number_of_empty_receives_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Sent Message Size"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.sqs.sent_message_size_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}
