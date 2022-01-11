terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = ">= 1.51.1"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_ec2_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS EC2 (${var.aws_region})"

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
      metric              = "aws.ec2.cpuutilization"

      include_filters = [
        {
          key   = "region"
          value = var.aws_region
        }
      ]

      group_by {
        aggregation_method = "max"
        keys               = ["instance_id"]
      }
    }
  }

  chart {
    name = "CPU Credit"
    rank = 2
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.ec2.cpucredit_usage"

      include_filters = [
        {
          key   = "region"
          value = var.aws_region
        }
      ]

      group_by {
        aggregation_method = "max"
        keys               = ["instance_id"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.ec2.cpucredit_balance"

      include_filters = [
        {
          key   = "region"
          value = var.aws_region
        }
      ]

      group_by {
        aggregation_method = "max"
        keys               = ["instance_id"]
      }
    }
  }

  chart {
    name = "Disk Ops"
    rank = 3
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.ec2.disk_read_ops"

      include_filters = [
        {
          key   = "region"
          value = var.aws_region
        }
      ]

      group_by {
        aggregation_method = "max"
        keys               = ["instance_id"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.ec2.disk_write_ops"

      include_filters = [
        {
          key   = "region"
          value = var.aws_region
        }
      ]

      group_by {
        aggregation_method = "max"
        keys               = ["instance_id"]
      }
    }
  }

  chart {
    name = "Disk Bytes"
    rank = 4
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.ec2.disk_read_bytes"

      include_filters = [
        {
          key   = "region"
          value = var.aws_region
        }
      ]

      group_by {
        aggregation_method = "max"
        keys               = ["instance_id"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.ec2.disk_write_bytes"

      include_filters = [
        {
          key   = "region"
          value = var.aws_region
        }
      ]

      group_by {
        aggregation_method = "max"
        keys               = ["instance_id"]
      }
    }
  }

  chart {
    name = "Network"
    rank = 5
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.ec2.network_in"

      include_filters = [
        {
          key   = "region"
          value = var.aws_region
        }
      ]

      group_by {
        aggregation_method = "max"
        keys               = ["instance_id"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.ec2.network_out"

      include_filters = [
        {
          key   = "region"
          value = var.aws_region
        }
      ]

      group_by {
        aggregation_method = "max"
        keys               = ["instance_id"]
      }
    }
  }

  chart {
    name = "Network Packets"
    rank = 6
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.ec2.network_packets_in"

      include_filters = [
        {
          key   = "region"
          value = var.aws_region
        }
      ]

      group_by {
        aggregation_method = "max"
        keys               = ["instance_id"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.ec2.network_packets_out"

      include_filters = [
        {
          key   = "region"
          value = var.aws_region
        }
      ]

      group_by {
        aggregation_method = "max"
        keys               = ["instance_id"]
      }
    }
  }

  chart {
    name = "Status Check"
    rank = 7
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.ec2.status_check_failed_system"

      include_filters = [
        {
          key   = "region"
          value = var.aws_region
        }
      ]

      group_by {
        aggregation_method = "max"
        keys               = ["instance_id"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.ec2.status_check_failed_instance"

      include_filters = [
        {
          key   = "region"
          value = var.aws_region
        }
      ]

      group_by {
        aggregation_method = "max"
        keys               = ["instance_id"]
      }
    }

    query {
      hidden              = false
      query_name          = "c"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.ec2.status_check_failed"

      include_filters = [
        {
          key   = "region"
          value = var.aws_region
        }
      ]

      group_by {
        aggregation_method = "max"
        keys               = ["instance_id"]
      }
    }
  }

}
