terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.86.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_inspector_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS Inspector"

  chart {
    name = "Total Findings"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      query_string = <<EOT
metric aws.inspector.total_findings_count | delta | group_by [], sum
EOT

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

      query_string = <<EOT
metric aws.inspector.total_matching_agents_count | delta | group_by [], sum
EOT

    }

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      query_string = <<EOT
metric aws.inspector.total_healthy_agents_count | delta | group_by [], sum
EOT

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

      query_string = <<EOT
metric aws.inspector.total_assessment_runs_count | delta | group_by [], sum
EOT

    }

  }

}
