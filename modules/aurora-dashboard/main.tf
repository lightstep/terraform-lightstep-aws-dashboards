terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.88.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_aurora_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS Aurora"
  dashboard_description = "Monitor AWS Aurora with this overview dashboard."

  chart {
    name = "Binary lag replica DB cluster"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_binlog_replica_lag_count | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_binlog_replica_lag_max | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

    query {
      query_name   = "c"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_binlog_replica_lag_min | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

    query {
      query_name   = "d"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_binlog_replica_lag_sum | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

  }

  chart {
    name = "DML Throughput"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_dml_rejected_master_full_count | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_dml_rejected_master_full_max | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

    query {
      query_name   = "c"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_dml_rejected_master_full_min | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

    query {
      query_name   = "d"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_dml_rejected_master_full_sum | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

  }

  chart {
    name = "Parallel Query Attempted"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_pq_request_attempted_count | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_pq_request_attempted_max | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

    query {
      query_name   = "c"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_pq_request_attempted_min | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

    query {
      query_name   = "d"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_pq_request_attempted_sum | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

  }

  chart {
    name = "Parallel Query Executed"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_pq_request_executed_count | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_pq_request_executed_max | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

    query {
      query_name   = "c"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_pq_request_executed_min | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

    query {
      query_name   = "d"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.rds.aurora_pq_request_attempted_sum | delta | group_by ["DBClusterIdentifier"], sum
EOT
    }

  }

}
