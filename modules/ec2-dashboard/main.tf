terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.10"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_ec2_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS EC2 (${var.aws_region})"

  chart {
    name = "CPU Utilization"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.ec2.cpu_utilization_max"
      timeseries_operator = "last"

      group_by {
        aggregation_method = "max"
        keys               = ["InstanceId", ]
      }

    }

  }

  chart {
    name = "CPU Credit"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.ec2.cpu_credit_usage_max"
      timeseries_operator = "last"

      group_by {
        aggregation_method = "max"
        keys               = ["InstanceId", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.ec2.cpu_credit_balance_max"
      timeseries_operator = "last"

      group_by {
        aggregation_method = "max"
        keys               = ["InstanceId", ]
      }

    }

  }

  chart {
    name = "Disk Ops"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.ec2.disk_read_ops_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["InstanceId", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.ec2.disk_write_ops_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["InstanceId", ]
      }

    }

  }

  chart {
    name = "Disk Bytes"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.ec2.disk_read_bytes_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["InstanceId", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.ec2.disk_write_bytes_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["InstanceId", ]
      }

    }

  }

  chart {
    name = "Network"
    rank = "5"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.ec2.network_in_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["InstanceId", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.ec2.network_out_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["InstanceId", ]
      }

    }

  }

  chart {
    name = "Network Packets"
    rank = "6"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.ec2.network_packets_in_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["InstanceId", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.ec2.network_packets_out_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["InstanceId", ]
      }

    }

  }

  chart {
    name = "Status Check"
    rank = "7"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.ec2.status_check_failed_system_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "max"
        keys               = ["InstanceId", ]
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.ec2.status_check_failed_instance_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "max"
        keys               = ["InstanceId", ]
      }

    }

    query {
      query_name = "c"
      display    = "bar"
      hidden     = false

      metric              = "aws.ec2.status_check_failed_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "max"
        keys               = ["InstanceId", ]
      }

    }

  }

}
