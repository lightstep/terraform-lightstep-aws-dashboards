terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.91.1"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_elasticmapreduce_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS EMR Hadoop 2"
  dashboard_description = "Monitor AWS EMR with this dashboard."

  chart {
    name = "Containers"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.container_allocated_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.container_allocated_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.container_pending_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.container_pending_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.container_reserved_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.container_reserved_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Nodes"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.core_nodes_pending_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.core_nodes_pending_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.core_nodes_running_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.core_nodes_running_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.live_data_nodes_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.live_data_nodes_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "d"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.mr_total_nodes_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.mr_total_nodes_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "e"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.mr_active_nodes_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.mr_active_nodes_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "f"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.mr_lost_nodes_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.mr_lost_nodes_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "g"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.mr_unhealthy_nodes_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.mr_unhealthy_nodes_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "h"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.mr_decommissioned_nodes_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.mr_decommissioned_nodes_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "i"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.mr_rebooted_nodes_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.mr_rebooted_nodes_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Apps"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.apps_completed_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.apps_completed_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.apps_failed_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.apps_failed_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.apps_killed_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.apps_killed_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "d"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.apps_pending_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.apps_pending_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "e"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.apps_running_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.apps_running_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "f"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.apps_submitted_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.apps_submitted_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "S 3"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.s_3_bytes_read_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.s_3_bytes_read_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.s_3_bytes_written_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.s_3_bytes_written_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "HDFS"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.hdfs_bytes_read_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.hdfs_bytes_read_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.hdfs_bytes_written_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.hdfs_bytes_written_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.hdfs_utilization_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.hdfs_utilization_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Blocks"
    rank = "5"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.corrupt_blocks_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.corrupt_blocks_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.dfs_pending_replication_blocks_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.dfs_pending_replication_blocks_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.missing_blocks_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.missing_blocks_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "d"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.pending_deletion_blocks_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.pending_deletion_blocks_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "e"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.under_replicated_blocks_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.under_replicated_blocks_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "Memory"
    rank = "6"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.memory_allocated_mb_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.memory_allocated_mb_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.memory_reserved_mb_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.memory_reserved_mb_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.elasticmapreduce.memory_total_mb_sum | delta | group_by [], sum;
  b = metric aws.elasticmapreduce.memory_total_mb_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

}
