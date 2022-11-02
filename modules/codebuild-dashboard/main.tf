terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.60.2"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_codebuild_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "aws codebuild"

  chart {
    name = "Duration"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.codebuild.duration_count"
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

      metric              = "aws.codebuild.builds_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Failed Builds"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "g"
      display    = "bar"
      hidden     = false

      metric              = "aws.codebuild.failed_builds_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.codebuild.succeeded_builds_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Build Duration"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "g"
      display    = "bar"
      hidden     = false

      metric              = "aws.codebuild.build_duration_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.codebuild.download_source_duration_count"
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

      metric              = "aws.codebuild.finalizing_duration_count"
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

      metric              = "aws.codebuild.install_duration_count"
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

      metric              = "aws.codebuild.post_build_duration_count"
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

      metric              = "aws.codebuild.pre_build_duration_count"
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

      metric              = "aws.codebuild.provisioning_duration_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "h"
      display    = "bar"
      hidden     = false

      metric              = "aws.codebuild.queued_duration_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "i"
      display    = "bar"
      hidden     = false

      metric              = "aws.codebuild.submitted_duration_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "j"
      display    = "bar"
      hidden     = false

      metric              = "aws.codebuild.upload_artifacts_duration_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}
