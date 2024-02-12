terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.91.1"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_efs_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS EFS"
  dashboard_description = ""

  chart {
    name = "Bytes"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.efs.total_io_bytes_max | latest | group_by ["FileSystemId"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.efs.data_write_io_bytes_max | latest | group_by ["FileSystemId"], sum
EOT
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.efs.metadata_io_bytes_max | latest | group_by ["FileSystemId"], sum
EOT
    }

  }

  chart {
    name = "Connections"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.efs.client_connections_max | latest | group_by [], sum"
    }

  }

  chart {
    name = "Burst Credit Balance / Permitted Throughput"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.efs.burst_credit_balance_count | delta | group_by ["FileSystemId"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.efs.permitted_throughput_count | delta | group_by ["FileSystemId"], sum
EOT
    }

  }

  chart {
    name = "Percent IO Limit"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.efs.percent_io_limit_max | latest | group_by ["FileSystemId"], sum
EOT
    }

  }
}
