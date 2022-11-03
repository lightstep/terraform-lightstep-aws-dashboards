terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.60.2"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_inspector_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS INSPECTOR"

  chart {
    name = "Total Findings"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.inspector.total_findings_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Total Matching Agents"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.inspector.total_matching_agents_count"
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

      metric              = "aws.inspector.total_healthy_agents_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Total Assessment Runs"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.inspector.total_assessment_runs_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}
