terraform {
  required_providers {
    lightstep = {
      source  = "lightstep/lightstep"
      version = "~> 1.60.2"
    }
  }
  required_version = ">= v1.0.11"
}

resource "lightstep_metric_dashboard" "aws_billing_dashboard" {
  project_name   = var.lightstep_project
  dashboard_name = "AWS Billing"

  chart {
    name = "Estimated Charges"
    rank = "0"
    type = "timeseries"

    query {
      query_name = "a"
      display    = "bar"
      hidden     = false

      metric              = "aws.billing.estimated_charges_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["Currency",]
      }

    }
    

  }

}
