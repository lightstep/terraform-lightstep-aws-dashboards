terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.92.0"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_dashboard" "aws_certificatemanager_dashboard" {
  project_name          = var.lightstep_project
  dashboard_name        = "AWS Certificate Manager"
  dashboard_description = "Monitor AWS Certificate Manager with this dashboard."

  chart {
    name = "Days To Expiry"
    rank = "0"
    type = "timeseries"

    query {
      query_name   = "a"
      display      = "line"
      hidden       = false
      query_string = <<EOT
with
  a = metric aws.certificatemanager.days_to_expiry_sum | delta | group_by [], sum;
  b = metric aws.certificatemanager.days_to_expiry_count | delta | group_by [], sum;
join (a / b), a = 0, b = 0
EOT
    }

  }

}
