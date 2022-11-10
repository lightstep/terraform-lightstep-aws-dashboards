terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.60.2"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_backup_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS Backup"

  chart {
    name = "Number of Backup Jobs"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_backup_jobs_created_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }


    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_backup_jobs_pending_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }


    query {
      query_name = "c"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_backup_jobs_running_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "d"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_backup_jobs_completed_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "e"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_backup_jobs_failed_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "f"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_backup_jobs_expired_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Number of Copy Jobs"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_copy_jobs_created_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_copy_jobs_running_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "c"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_copy_jobs_completed_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "d"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_copy_jobs_failed_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Number of Restore Jobs"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_restore_jobs_pending_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_restore_jobs_running_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "c"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_restore_jobs_completed_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "d"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_restore_jobs_failed_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Number of Recovery Points"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_recovery_points_completed_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_recovery_points_partial_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "c"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_recovery_points_expired_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "d"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_recovery_points_deleting_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "e"
      display    = "bar"
      hidden     = false

      metric              = "aws.backup.number_of_recovery_points_cold_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }


}