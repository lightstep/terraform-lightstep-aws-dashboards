terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.93.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_route53_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS Route53"
  dashboard_description = "Monitor AWS Route53 with this summary dashboard."

  chart {
    name = "Health Check Percentage Healthy"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.route53.health_check_percentage_healthy_sum | delta | group_by [], sum"
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.route53.child_health_check_healthy_count_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Connection Time"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.route53.connection_time_sum | delta | group_by [], sum"
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.route53.time_to_first_byte_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "Health Check Status"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.route53.health_check_status_sum | delta | group_by [], sum"
    }

  }

  chart {
    name = "SSL Handshake Time"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = "metric aws.route53.ssl_handshake_time_sum | delta | group_by [], sum"
    }

  }

}
