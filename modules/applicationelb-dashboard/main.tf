terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = ">= 1.51.2"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_app_elb_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS Application ELB"

  chart {
    name = "Request Count / Target Response Time"
    rank = 1
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.applicationelb.request_count"

      group_by {
        aggregation_method = "max"
        keys               = ["loadbalancer"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.applicationelb.target_response_time"

      group_by {
        aggregation_method = "max"
        keys               = ["loadbalancer"]
      }
    }
  }

  chart {
    name = "HTTP Code"
    rank = 2
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.applicationelb.httpcode_elb_5xx"

      group_by {
        aggregation_method = "max"
        keys               = ["loadbalancer"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.applicationelb.httpcode_elb_4xx"

      group_by {
        aggregation_method = "max"
        keys               = ["loadbalancer"]
      }
    }

    query {
      hidden              = false
      query_name          = "c"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.applicationelb.httpcode_elb_3xx"

      group_by {
        aggregation_method = "max"
        keys               = ["loadbalancer"]
      }
    }

    query {
      hidden              = false
      query_name          = "d"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.applicationelb.httpcode_elb_2xx"

      group_by {
        aggregation_method = "max"
        keys               = ["loadbalancer"]
      }
    }
  }

  chart {
    name = "Connection Count"
    rank = 3
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.applicationelb.active_connection_count"

      group_by {
        aggregation_method = "max"
        keys               = ["loadbalancer"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.applicationelb.new_connection_count"

      group_by {
        aggregation_method = "max"
        keys               = ["loadbalancer"]
      }
    }
  }

  chart {
    name = "Consumed LB Capacity Units / Processed Bytes"
    rank = 4
    type = "timeseries"

    query {
      hidden              = false
      query_name          = "a"
      display             = "line"
      timeseries_operator = "last"
      metric              = "aws.applicationelb.consumed_lcus"

      group_by {
        aggregation_method = "max"
        keys               = ["loadbalancer"]
      }
    }

    query {
      hidden              = false
      query_name          = "b"
      display             = "line"
      timeseries_operator = "delta"
      metric              = "aws.applicationelb.processed_bytes"

      group_by {
        aggregation_method = "max"
        keys               = ["loadbalancer"]
      }
    }
  }
}
