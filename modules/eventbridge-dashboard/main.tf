terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.9"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_eventbridge_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS EventBridge"

  chart {
    name = "Triggered Rules"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = "metric aws.events.triggered_rules_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Invocations"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = "metric aws.events.invocations_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Dead Letter Invocations / Failed Invocations / Invocations Failed To Be Sent To Dlq / Invocations Sent To Dlq / Throttled Rules"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = "metric aws.events.dead_letter_invocations_sum | delta | group_by [], sum"
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = "metric aws.events.failed_invocations_sum | delta | group_by [], sum"
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = "metric aws.events.invocations_failed_to_be_sent_to_dlq_sum | delta | group_by [], sum"
    }

    query {
      query_name   = "d"
      display      = "line"
      hidden       = false
      query_string = "metric aws.events.invocations_sent_to_dlq_sum | delta | group_by [], sum"
    }

    query {
      query_name   = "e"
      display      = "line"
      hidden       = false
      query_string = "metric aws.events.throttled_rules_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Matched Events"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = "metric aws.events.matched_events_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Ingestion To Invocation Start Latency"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = "metric aws.events.ingestion_to_invocation_start_latency_sum | delta | group_by [], sum"
    }

  }

}
