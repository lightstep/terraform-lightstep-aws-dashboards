terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.1"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_aurora_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS AURORA"

  chart {
    name = "Binary lag replica DB cluster"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_binlog_replica_lag_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_binlog_replica_lag_max"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_binlog_replica_lag_min"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_binlog_replica_lag_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

  }

  chart {
    name = "DML Throughput"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_dml_rejected_master_full_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_dml_rejected_master_full_max"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_dml_rejected_master_full_min"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_dml_rejected_master_full_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

  }

  chart {
    name = "Parallel Query Attempted"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_attempted_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_attempted_max"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_attempted_min"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_attempted_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

  }

  chart {
    name = "Parallel Query Executed"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_executed_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_executed_max"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_executed_min"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_attempted_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["DBClusterIdentifier"]
      }

    }

  }

}
