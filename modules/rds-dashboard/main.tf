terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = ">= 1.51.1"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_rds_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS RDS"

  chart {
    name = "CPU Utilization"
    rank = 1
    type = "timeseries"

    y_axis {
      min = 0
      max = 100
    }

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.rds.cpuutilization"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }
  }

  chart {
    name = "Database Connections / Disk Queue Depth"
    rank = 2
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.rds.database_connections"

      group_by {
        aggregation_method = "count"
        keys               = ["dbinstanceidentifer"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.rds.disk_queue_depth"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }
  }

  chart {
    name = "Freeable Memory / Freeable Storage Space"
    rank = 3
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.rds.freeable_memory"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.rds.free_storage_space"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }
  }

  chart {
    name = "Read IOPS / Write IOPS / Burst Balance"
    rank = 4
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.rds.read_iops"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.rds.write_iops"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }

    query {
      hidden              = false
      query_name          = "c"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.rds.burst_balance"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }
  }

  chart {
    name = "Read Latency / Write Latency"
    rank = 5
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.rds.read_latency"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.rds.write_latency"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }
  }

  chart {
    name = "Read Throughput / Write Throughput"
    rank = 6
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.rds.read_throughput"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.rds.write_throughput"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }
  }

  chart {
    name = "Network Receive Throughput / Network Transmit Throughput"
    rank = 7
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.rds.network_receive_throughput"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.rds.network_transmit_throughput"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }
  }

  chart {
    name = "Swap Usage / Bin Log Disk Usage"
    rank = 8
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.rds.swap_usage"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.rds.bin_log_disk_usage"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }
  }

  chart {
    name = "CPU Credit Usage / CPU Credit Balance"
    rank = 9
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.rds.cpucredit_usage"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.rds.cpucredit_balance"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }
  }

  chart {
    name = "CPU Credit Usage / CPU Credit Balance"
    rank = 10
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.rds.cpucredit_usage"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.rds.cpucredit_balance"

      group_by {
        aggregation_method = "max"
        keys               = ["dbinstanceidentifer"]
      }
    }
  }

}
