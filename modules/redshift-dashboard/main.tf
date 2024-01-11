terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.86.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_redshift_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS Redshift"

  chart {
    name = "CPU Utilization"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.redshift.cpu_utilization_count | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.redshift.database_connections_count | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "Maintenance Mode"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.redshift.maintenance_mode_count | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.redshift.health_status_count | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "Network Receive Throughput"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.redshift.network_receive_throughput_count | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.redshift.network_transmit_throughput_count | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "Read IOPS"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.redshift.read_iops_count | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.redshift.write_iops_count | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "Read Latency"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.redshift.read_latency_count | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.redshift.write_latency_count | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "Read Throughput"
    rank = "5"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.redshift.read_throughput_count | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.redshift.write_throughput_count | delta | group_by [], sum
EOT
    }

  }

}