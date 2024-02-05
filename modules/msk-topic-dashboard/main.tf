terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.89.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_mks_topic_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS Kafka Topic"

  chart {
    name = "Messages In Per Sec"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.kafka.messages_in_per_sec_sum | delta | group_by [], sum;
  b = metric aws.kafka.messages_in_per_sec_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Fetch Message Conversions Per Sec"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.kafka.fetch_message_conversions_per_sec_sum | delta | group_by [], sum;
  b = metric aws.kafka.fetch_message_conversions_per_sec_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Produce Message Conversions Per Sec"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.kafka.fetch_message_conversions_per_sec_sum | delta | group_by [], sum;
  b = metric aws.kafka.fetch_message_conversions_per_sec_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Bytes In Per Sec"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.kafka.bytes_in_per_sec_sum | delta | group_by [], sum;
  b = metric aws.kafka.bytes_in_per_sec_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Bytes out Per Sec"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.kafka.bytes_out_per_sec_sum | delta | group_by [], sum;
  b = metric aws.kafka.bytes_out_per_sec_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

}
