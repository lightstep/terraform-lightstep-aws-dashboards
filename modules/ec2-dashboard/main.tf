terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.87.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_ec2_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS EC2"
  dashboard_description = "Monitor AWS EC2 - compute - performance metrics."

  chart {
    name = "CPU Utilization"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ec2.cpu_utilization_sum | delta | group_by ["InstanceId"], sum
EOT
    }
  }

  chart {
    name = "CPU Credit"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ec2.cpu_credit_usage_sum | delta | group_by ["InstanceId"], sum 
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ec2.cpu_credit_balance_sum | delta | group_by ["InstanceId"], sum
EOT
    }
  }

  chart {
    name = "Disk Ops"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ec2.disk_read_ops_sum | delta | group_by ["InstanceId"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ec2.disk_write_ops_sum | delta | group_by ["InstanceId"], sum
EOT
    }
  }

  chart {
    name = "Disk Bytes"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ec2.disk_read_bytes_sum | delta | group_by ["InstanceId"], sum 
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ec2.disk_write_bytes_sum | delta | group_by ["InstanceId"], sum
EOT
    }
  }

  chart {
    name = "Network Bytes"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ec2.network_in_sum | delta | group_by ["InstanceId"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ec2.network_out_sum | delta | group_by ["InstanceId"], sum 
EOT
    }
  }

  chart {
    name = "Network Packets"
    rank = "5"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ec2.network_packets_in_sum | delta | group_by ["InstanceId"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ec2.network_packets_out_sum | delta | group_by ["InstanceId"], sum
EOT
    }
  }

  chart {
    name = "Status Check"
    rank = "6"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.ec2.status_check_failed_system_count | delta | group_by ["InstanceId"], max
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.ec2.status_check_failed_instance_count | delta | group_by ["InstanceId"], max
EOT
    }

    query {
      query_name   = "c"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.ec2.status_check_failed_count | delta | group_by ["InstanceId"], max
EOT
    }
  }
}
