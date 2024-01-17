terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.86.1"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_networkfirewall_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS Network Firewall"
  dashboard_description = "Monitor AWS Network Firewall with this dashboard."

  chart {
    name = "Passed Packets / Dropped Packets "
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.networkfirewall.passed_packets_sum | delta | group_by [], sum;
  b = metric aws.networkfirewall.passed_packets_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.networkfirewall.dropped_packets_sum | delta | group_by [], sum;
  b = metric aws.networkfirewall.dropped_packets_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Received Packets Count"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.networkfirewall.received_packet_count_sum | delta | group_by [], sum;
  b = metric aws.networkfirewall.received_packet_count_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Packets / Bytes Out"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.networkfirewall.packets_sum | delta | group_by [], sum;
  b = metric aws.networkfirewall.packets_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.transitgateway.bytes_out_sum | delta | group_by [], sum;
  b = metric aws.transitgateway.bytes_out_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

}
