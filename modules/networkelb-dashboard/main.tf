terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.60.2"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_networkelb_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS NETWORKELB"

  chart {
    name = "Healthy Host Count"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "d"
      display    = "bar"
      hidden     = false

      metric              = "aws.networkelb.healthy_host_count_count"
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

      metric              = "aws.networkelb.un_healthy_host_count_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Active Flow Count"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.networkelb.active_flow_count_count"
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

      metric              = "aws.networkelb.new_flow_count_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "New Flow Count _ TLS"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "d"
      display    = "bar"
      hidden     = false

      metric              = "aws.networkelb.new_flow_count___tls_count"
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

      metric              = "aws.networkelb.active_flow_count___tls_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Processed Bytes"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.networkelb.processed_bytes_count"
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

      metric              = "aws.networkelb.consumed_lc_us_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "Client TLS Negotiation Error Count"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "d"
      display    = "bar"
      hidden     = false

      metric              = "aws.networkelb.client_tls_negotiation_error_count_count"
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

      metric              = "aws.networkelb.target_tls_negotiation_error_count_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "TCP _ Client _ Reset _ Count"
    rank = "5"
    type = "timeseries"

    query {
      query_name = "d"
      display    = "bar"
      hidden     = false

      metric              = "aws.networkelb.tcp___client___reset___count_count"
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

      metric              = "aws.networkelb.tcp___elb___reset___count_count"
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

      metric              = "aws.networkelb.tcp___target___reset___count_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

}
