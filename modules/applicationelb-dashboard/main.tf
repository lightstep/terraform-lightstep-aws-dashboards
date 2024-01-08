terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.86.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_applicationelb_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS Application ELB"
  dashboard_description = "Monitor AWS Application ELB with this overview dashboard."

  chart {
    name = "RequestCount / TargetResponseTime"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.request_count_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.applicationelb.target_response_time_sum | reduce sum | group_by [], sum;
  b = metric aws.applicationelb.target_response_time_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "HTTPCode_Target"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.http_code_target_5xx_count_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.http_code_target_4xx_count_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.http_code_target_3xx_count_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "d"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.http_code_target_2xx_count_sum | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "HTTPCode_ELB"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.http_code_elb_3xx_count_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.http_code_elb_4xx_count_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.http_code_elb_5xx_count_sum | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "ConnectionCount"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.applicationelb.active_connection_count_sum | reduce sum | group_by [], sum;
  b = metric aws.applicationelb.active_connection_count_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.applicationelb.new_connection_count_sum | reduce sum | group_by [], sum;
  b = metric aws.applicationelb.new_connection_count_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.applicationelb.rejected_connection_count_sum | reduce sum | group_by [], sum;
  b = metric aws.applicationelb.rejected_connection_count_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "d"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.applicationelb.target_connection_error_count_sum | reduce sum | group_by [], sum;
  b = metric aws.applicationelb.target_connection_error_count_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "ConsumedLBCapacityUnits / ConsumedLCUs / ProcessedBytes"
    rank = "4"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.applicationelb.consumed_lb_capacity_units_sum | reduce sum | group_by [], sum;
  b = metric aws.applicationelb.consumed_lb_capacity_units_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.applicationelb.processed_bytes_sum | reduce sum | group_by [], sum;
  b = metric aws.applicationelb.processed_bytes_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }
    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.applicationelb.consumed_lc_us_sum | reduce sum | group_by [], sum;
  b = metric aws.applicationelb.consumed_lc_us_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

  chart {
    name = "TLSNegotiationErrorCount"
    rank = "5"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.target_tls_negotiation_error_count_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.client_tls_negotiation_error_count_sum | delta | group_by [], sum
EOT
    }
  }

  chart {
    name = "IPv6"
    rank = "6"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.i_pv_6_request_count_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.i_pv_6_processed_bytes_sum | delta | group_by [], sum
EOT
    }

  }

  chart {
    name = "RuleEvaluations"
    rank = "7"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.rule_evaluations_sum | delta | group_by [], sum
EOT
    }
  }

  chart {
    name = "Auth"
    rank = "8"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.elb_auth_error_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.elb_auth_failure_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "c"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.elb_auth_success_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "d"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.elb_auth_refresh_token_success_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "e"
      display      = "line"
      hidden       = false
      query_string = <<EOT
metric aws.applicationelb.elb_auth_user_claims_size_exceeded_sum | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "f"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.applicationelb.elb_auth_latency_sum | reduce sum | group_by [], sum;
  b = metric aws.applicationelb.elb_auth_latency_count | reduce sum | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }
}
