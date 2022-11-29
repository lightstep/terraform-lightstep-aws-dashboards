terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.70.9"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_cloudhsm_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS CloudHSM"

  chart {
    name = "HSM Session Count"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudhsm.hsm_session_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "HSM Temperature"
    rank = "1"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudhsm.hsm_temperature_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = []
      }

    }

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudhsm.hsm_temperature_min"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "min"
        keys               = []
      }

    }

  }

  chart {
    name = "HSM Keys Session Occupied"
    rank = "2"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudhsm.hsm_keys_session_occupied_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "HSM Keys Token Occupied"
    rank = "3"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudhsm.hsm_keys_token_occupied_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "HSM SSL CTXs Occupied"
    rank = "4"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudhsm.hsm_ssl_ctxs_occupied_sum"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "HSM Users Available"
    rank = "5"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudhsm.hsm_users_available_sum"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "sum"
        keys               = []
      }

    }

  }

  chart {
    name = "HSM Users Max"
    rank = "6"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.cloudhsm.hsm_users_max_max"
      timeseries_operator = "last"


      group_by {
        aggregation_method = "max"
        keys               = []
      }

    }

  }

}
