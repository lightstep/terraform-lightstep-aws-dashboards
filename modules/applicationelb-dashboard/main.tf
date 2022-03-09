terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.60.2"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_app_elb_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS Application ELB"

  chart {
    name = "Request Count"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.application_elb.request_count_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "max"
        keys               = ["LoadBalancer", ]
      }

    }

  }

  chart {
    name = "HTTP Code"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.application_elb.http_code_elb_5xx_count_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "max"
        keys               = ["LoadBalancer", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.application_elb.http_code_elb_4xx_count_count"
      timeseries_operator = "rate"


      group_by {
        aggregation_method = "max"
        keys               = ["LoadBalancer", ]
      }

    }

  }

  chart {
    name = "Connection Count"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.application_elb.active_connection_count_count"
      timeseries_operator = "delta"

      group_by {
        aggregation_method = "max"
        keys               = ["LoadBalancer", ]
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.application_elb.new_connection_count_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "max"
        keys               = ["LoadBalancer", ]
      }

    }

  }

  chart {
    name = "Consumed LB Capacity Units / Processed Bytes"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "line"
      hidden     = false

      metric              = "aws.application_elb.consumed_lcus_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["LoadBalancer", ]
      }

    }

    query {
      query_name = "b"
      display    = "line"
      hidden     = false

      metric              = "aws.application_elb.processed_bytes_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = ["LoadBalancer", ]
      }

    }

  }
}