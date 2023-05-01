terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.76.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_efs_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS EFS"

  chart {
    name = "Bytes"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.efs.total_io_bytes_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["FileSystemId", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.efs.data_write_io_bytes_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["FileSystemId", ]
      }

    }

    query {
      query_name = "c"
      display    = "line"
      hidden     = false

      metric              = "aws.efs.metadata_io_bytes_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["FileSystemId", ]
      }

    }

  }

  chart {
    name = "Connections"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.efs.client_connections_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Burst Credit Balance / Permitted Throughput"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.efs.burst_credit_balance_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["FileSystemId", ]
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.efs.permitted_throughput_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["FileSystemId", ]
      }

    }

  }

  chart {
    name = "Percent IO Limit"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.efs.percent_io_limit_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = ["FileSystemId", ]
      }

    }

  }

}
