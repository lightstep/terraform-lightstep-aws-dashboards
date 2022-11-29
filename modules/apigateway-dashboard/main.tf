terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.9"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_apigateway_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS API Gateway"

  chart {
    name = "Request Count"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.api_gateway.count_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Latency / Integration Latency"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.api_gateway.integration_latency_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.api_gateway.latency_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Errors"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.api_gateway.4xx_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.api_gateway.5xx_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Data Processed"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.api_gateway.data_processed_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}
