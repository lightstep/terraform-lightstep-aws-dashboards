terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.86.1"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_cognito_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS Cognito"
  dashboard_description = "Monitor AWS Cognito with this dashboard."

  chart {
    name = "Sign In Successes"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cognito.sign_in_successes_count | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cognito.sign_in_throttles_count | delta | group_by [], sum
EOT
    }
  }

  chart {
    name = "Token Refresh Successes"
    rank = "1"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cognito.token_refresh_successes_count | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cognito.token_refresh_throttles_count | delta | group_by [], sum
EOT
    }
  }

  chart {
    name = "Sign Up Successes"
    rank = "2"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cognito.sign_up_successes_count | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cognito.sign_up_throttles_count | delta | group_by [], sum
EOT
    }
  }

  chart {
    name = "Federation Successes"
    rank = "3"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cognito.federation_successes_count | delta | group_by [], sum
EOT
    }

    query {
      query_name   = "b"
      display      = "bar"
      hidden       = false
      query_string = <<EOT
metric aws.cognito.federation_throttles_count | delta | group_by [], sum
EOT
    }
  }
}
