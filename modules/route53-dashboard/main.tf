terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.60"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_route53_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS Route53"

  chart {
    name = "Health Check Percentage Healthy"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "g"
      display    = "bar"
      hidden     = false

      metric              = "aws.route53.health_check_percentage_healthy_sum"
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

      metric              = "aws.route53.child_health_check_healthy_count_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Connection Time"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "g"
      display    = "bar"
      hidden     = false

      metric              = "aws.route53.connection_time_sum"
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

      metric              = "aws.route53.time_to_first_byte_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Health Check Status"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "g"
      display    = "bar"
      hidden     = false

      metric              = "aws.route53.health_check_status_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "SSL Handshake Time"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "g"
      display    = "bar"
      hidden     = false

      metric              = "aws.route53.ssl_handshake_time_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}
