terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.60.2"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_rds_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS RDS"

  chart {
    name = "CPU Utilization"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.cpu_utilization_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }

  chart {
    name = "Database Connections / Disk Queue Depth"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.database_connections_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "count"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.disk_queue_depth_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }

  chart {
    name = "Freeable Memory / Freeable Storage Space"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.freeable_memory_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.free_storage_space_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }

  chart {
    name = "Read IOPS / Write IOPS / Burst Balance"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.read_iops_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.write_iops_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "c"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.burst_balance_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }

  chart {
    name = "Read Latency / Write Latency"
    rank = "5"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.read_latency_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.write_latency_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }

  chart {
    name = "Read Throughput / Write Throughput"
    rank = "6"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.read_throughput_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.write_throughput_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer", ]
      }

    }

  }

  chart {
    name = "Network Receive Throughput / Network Transmit Throughput"
    rank = "7"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.network_receive_throughput_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.network_transmit_throughput_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }

  chart {
    name = "Swap Usage / Bin Log Disk Usage"
    rank = "8"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.swap_usage_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.bin_log_disk_usage_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }

  chart {
    name = "CPU Credit Usage / CPU Credit Balance"
    rank = "9"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.cpu_credit_usage_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.cpu_credit_balance_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }

  chart {
    name = "CPU Credit Usage / CPU Credit Balance"
    rank = "10"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.cpu_credit_usage_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.cpu_credit_balance_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }

}