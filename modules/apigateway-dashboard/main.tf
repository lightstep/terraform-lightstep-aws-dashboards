terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.91.1"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_apigateway_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS API Gateway"

  chart {
    name = "Request Count"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      query_string = <<EOT
metric aws.api_gateway.count_count | delta | group_by [], sum
EOT
      display      = "line"
      hidden       = false
    }
  }

  chart {
    name = "Latency / Integration Latency"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      query_string = <<EOT
metric aws.api_gateway.integration_latency_max | latest | group_by [], sum
EOT
      display      = "line"
      hidden       = false
    }

    query {
      query_name   = "a"
      query_string = <<EOT
metric aws.api_gateway.latency_max | latest | group_by [], sum
EOT
      display      = "line"
      hidden       = false
    }
  }

  chart {
    name = "Errors"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      query_string = <<EOT
metric aws.api_gateway.4xx_count | delta | group_by [], sum
EOT
      display      = "line"
      hidden       = false
    }

    query {
      query_name   = "a"
      query_string = <<EOT
metric aws.api_gateway.5xx_count | rate | group_by [], sum
EOT
      display      = "line"
      hidden       = false
    }
  }

  chart {
    name = "Data Processed"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      query_string = <<EOT
metric aws.api_gateway.data_processed_max | latest | group_by [], sum
EOT
      display      = "line"
      hidden       = false
    }
  }
}
