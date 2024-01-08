terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.86.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_cloudhsm_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS CloudHSM"

  chart {
    name = "HSM Session Count"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cloudhsm.hsm_session_sum | delta | group_by [], sum
EOT
    }
  }

  chart {
    name = "HSM Temperature"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cloudhsm.hsm_temperature_max | latest | group_by [], max
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cloudhsm.hsm_temperature_min | latest | group_by [], min
EOT
    }
  }

  chart {
    name = "HSM Keys Session Occupied"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cloudhsm.hsm_keys_session_occupied_sum | delta | group_by [], sum
EOT
    }
  }

  chart {
    name = "HSM Keys Token Occupied"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cloudhsm.hsm_keys_token_occupied_sum | delta | group_by [], sum
EOT
    }
  }

  chart {
    name = "HSM SSL CTXs Occupied"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cloudhsm.hsm_ssl_ctxs_occupied_sum | delta | group_by [], sum
EOT
    }
  }

  chart {
    name = "HSM Users Available"
    rank = "5"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cloudhsm.hsm_users_available_sum | latest | group_by [], sum
EOT
    }
  }

  chart {
    name = "HSM Users Max"
    rank = "6"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cloudhsm.hsm_users_max_max | latest | group_by [], max
EOT
    }
  }
}
