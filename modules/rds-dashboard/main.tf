terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.9"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_rds_dashboard" {
  project_name = var.lightstep_project
  dashboard_name = "AWS RDS"

  chart {
    name = "CPUUtilization/FailedSQLServerAgentJobsCount"
    rank = "0"
    type = "timeseries"

    query {
      query_name          = "a"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.cpu_utilization_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.cpu_utilization_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name          = "b"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.failed_sql_server_agent_jobs_count_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.failed_sql_server_agent_jobs_count_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "DatabaseConnections/DiskQueueDepth"
    rank = "1"
    type = "timeseries"

    query {
      query_name          = "a"
      display             = "line"
      hidden              = false
      query_string        = "metric aws.rds.database_connections_max | reduce max | group_by [], max"
    }

    query {
      query_name          = "b"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.disk_queue_depth_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.disk_queue_depth_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "FreeableMemory/FreeStorageSpace"
    rank = "2"
    type = "timeseries"

    query {
      query_name          = "a"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.freeable_memory_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.freeable_memory_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name          = "b"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.free_storage_space_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.free_storage_space_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "ReadIOPS/WriteIOPS/BurstBalance"
    rank = "3"
    type = "timeseries"

    query {
      query_name          = "a"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.read_iops_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.read_iops_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name          = "b"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.write_iops_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.write_iops_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name          = "c"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.burst_balance_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.burst_balance_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "ReadLatency/WriteLatency"
    rank = "4"
    type = "timeseries"

    query {
      query_name          = "a"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.read_latency_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.read_latency_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name          = "b"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.write_latency_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.write_latency_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "ReadThroughput/WriteThroughput"
    rank = "5"
    type = "timeseries"

    query {
      query_name          = "a"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.read_throughput_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.read_throughput_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name          = "b"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.write_throughput_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.write_throughput_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "NetworkReceiveThroughput/NetworkTransmitThroughput"
    rank = "6"
    type = "timeseries"

    query {
      query_name          = "a"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.network_receive_throughput_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.network_receive_throughput_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name          = "b"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.network_transmit_throughput_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.network_transmit_throughput_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "SwapUsage/BinLogDiskUsage"
    rank = "7"
    type = "timeseries"

    query {
      query_name          = "a"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.swap_usage_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.swap_usage_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name          = "b"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.bin_log_disk_usage_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.bin_log_disk_usage_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "CPUCreditUsage/CPUCreditBalance"
    rank = "8"
    type = "timeseries"

    query {
      query_name          = "a"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.cpu_credit_usage_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.cpu_credit_usage_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name          = "b"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.cpu_credit_balance_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.cpu_credit_balance_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "OldestReplicationSlotLag/ReplicaLag"
    rank = "9"
    type = "timeseries"

    query {
      query_name          = "a"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.oldest_replication_slot_lag_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.oldest_replication_slot_lag_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name          = "b"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.replica_lag_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.replica_lag_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "ReplicationSlotDiskUsage/TransactionLogsDiskUsage"
    rank = "10"
    type = "timeseries"

    query {
      query_name          = "a"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.oldest_replication_slot_lag_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.oldest_replication_slot_lag_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name          = "b"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.replica_lag_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.replica_lag_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "MaximumUsedTransactionIDs/TransactionLogsGeneration"
    rank = "11"
    type = "timeseries"

    query {
      query_name          = "a"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.maximum_used_transaction_i_ds_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.maximum_used_transaction_i_ds_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name          = "b"
      display             = "line"
      hidden              = false
      query_string        = <<EOT
with
  a = metric aws.rds.transaction_logs_generation_sum | reduce sum | group_by [], sum;
  b = metric aws.rds.transaction_logs_generation_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

}
