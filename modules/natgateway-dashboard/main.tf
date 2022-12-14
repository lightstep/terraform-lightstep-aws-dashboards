terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.10"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_natgateway_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS NATGateway"

  chart {
    name = "Bytes In From Destination"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.natgateway.bytes_in_from_destination_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["NatGatewayId", ]
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.natgateway.bytes_out_to_source_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["NatGatewayId", ]
      }

    }

  }

  chart {
    name = "Bytes In From Source"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.natgateway.bytes_in_from_source_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["NatGatewayId", ]
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.natgateway.bytes_out_to_destination_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["NatGatewayId", ]
      }

    }

  }

  chart {
    name = "Packets In From Destination"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.natgateway.packets_in_from_destination_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["NatGatewayId", ]
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.natgateway.packets_out_to_source_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["NatGatewayId", ]
      }

    }

  }

  chart {
    name = "Packets In From Source"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.natgateway.packets_in_from_source_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["NatGatewayId", ]
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.natgateway.packets_out_to_destination_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["NatGatewayId", ]
      }

    }

  }

  chart {
    name = "Idle Timeout Count"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.natgateway.idle_timeout_count_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["NatGatewayId", ]
      }

    }

  }

  chart {
    name = "Packets Drop Count"
    rank = "5"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.natgateway.packets_drop_count_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["NatGatewayId", ]
      }

    }

  }

  chart {
    name = "Error Port Allocation"
    rank = "6"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.natgateway.error_port_allocation_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["NatGatewayId", ]
      }

    }

  }

  chart {
    name = "Active Connection Count"
    rank = "7"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.natgateway.active_connection_count_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["NatGatewayId", ]
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.natgateway.connection_attempt_count_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["NatGatewayId", ]
      }

    }

    query {
      query_name = "c"
      display    = "bar"
      hidden     = false

      metric              = "aws.natgateway.connection_established_count_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["NatGatewayId", ]
      }

    }

  }

}
