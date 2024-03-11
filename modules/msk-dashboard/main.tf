terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.93.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_msk_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS MSK"

  chart {
    name = "Messages In Per Sec"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      query_string = <<EOT
metric aws.msk.messages_in_per_sec_count | delta | group_by ["Topic"], sum
EOT
    }

  }

  chart {
    name = "Fetch Message Conversions Per Sec"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      query_string = <<EOT
metric aws.msk.fetch_message_conversions_per_sec_count | delta | group_by ["Topic"], sum
EOT
    }

  }

  chart {
    name = "Fetch Message Conversions Per Sec"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      query_string = <<EOT
metric aws.msk.fetch_message_conversions_per_sec_count | delta | group_by ["Topic"], sum
EOT
    }

  }

  chart {
    name = "Bytes In Per Sec"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      query_string = <<EOT
metric aws.msk.bytes_in_per_sec_count | delta | group_by ["Topic"], sum
EOT
    }

  }

  chart {
    name = "Bytes Out Per Sec"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      query_string = <<EOT
metric aws.msk.bytes_out_per_sec_count | delta | group_by ["Topic"], sum
EOT
    }

  }

}