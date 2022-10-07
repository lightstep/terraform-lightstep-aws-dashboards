terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.60.2"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_aurora_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS Aurora"

  chart {
    name = "Binary lag replica DB cluster"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_binlog_replica_lag_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "count"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_binlog_replica_lag_max"
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

      metric              = "aws.rds.aurora_binlog_replica_lag_min"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "d"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_binlog_replica_lag_sum"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }

  chart {
    name = "DML Throughput"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_dml_rejected_master_full_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "count"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_dml_rejected_master_full_max"
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

      metric              = "aws.rds.aurora_dml_rejected_master_full_min"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "d"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_dml_rejected_master_full_sum"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }

  chart {
    name = "Parallel Query Attempted"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_attempted_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "count"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_attempted_max"
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

      metric              = "aws.rds.aurora_pq_request_attempted_min"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "d"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_attempted_sum"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }

  chart {
    name = "Parallel Query Executed"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_executed_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "count"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_executed_max"
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

      metric              = "aws.rds.aurora_pq_request_executed_min"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "d"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_attempted_sum"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }

  chart {
    name = "Parallel Query Executed"
    rank = "5"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_executed_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "count"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_executed_max"
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

      metric              = "aws.rds.aurora_pq_request_executed_min"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "min"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

    query {
      query_name = "d"
      display    = "line"
      hidden     = false

      metric              = "aws.rds.aurora_pq_request_executed_sum"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "max"
        keys               = ["DBInstanceIdentifier", ]
      }

    }

  }
}