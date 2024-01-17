terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.86.1"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_ebs_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS EBS"
  dashboard_description = "Monitor your EBS Volumes with this dashboard."

  chart {
    name = "Volume Queue Length"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.ebs.volume_queue_length_sum | delta | group_by [], sum;
  b = metric aws.ebs.volume_queue_length_count | delta | group_by [], sum;
join (a / b), a=0, b=0
EOT
    }

  }

  chart {
    name = "Read / Write / Idle Time"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.ebs.volume_total_read_time_sum | delta | group_by [], sum;
  b = metric aws.ebs.volume_total_read_time_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0


EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.ebs.volume_total_write_time_sum | delta | group_by [], sum;
  b = metric aws.ebs.volume_total_write_time_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0


EOT
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.ebs.volume_total_idle_time_sum | delta | group_by [], sum;
  b = metric aws.ebs.volume_total_idle_time_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0


EOT
    }

  }

  chart {
    name = "Volume Throughput Percentage"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.ebs.volume_throughput_percentage_sum | delta | group_by [], sum;
  b = metric aws.ebs.volume_throughput_percentage_count | delta | group_by [], sum;
join (a / b), a=0, b=0
EOT
    }

  }

  chart {
    name = "Read / Write (Total Throughput)"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.ebs.volume_read_bytes_sum | delta | group_by [], sum;
  b = metric aws.ebs.volume_write_bytes_sum | delta | group_by [], sum;
join (a / b), a=0, b=0
EOT
    }

  }

  chart {
    name = "Read / Write (Total Ops)"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.ebs.volume_read_ops_sum | delta | group_by [], sum;
  b = metric aws.ebs.volume_write_ops_sum| delta | group_by [], sum;
join (a / b), a = 0, b = 0


EOT
    }

  }

  chart {
    name = "Burst Balance"
    rank = "5"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.ebs.burst_balance_min | reduce min | group_by [], min
EOT
    }

  }

}
