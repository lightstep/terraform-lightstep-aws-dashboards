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

    query {
      query_name = "b"
      display    = "bar"
      hidden     = false

      metric              = "aws.billing.estimated_charges_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["Currency","ServiceName",]
      }

    }

    query {
      query_name = "c"
      display    = "bar"
      hidden     = false

      metric              = "aws.billing.estimated_charges_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["Currency","ServiceName",]
      }

    }

    query {
      query_name = "d"
      display    = "bar"
      hidden     = false

      metric              = "aws.billing.estimated_charges_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["Currency","ServiceName",]
      }

    }

    query {
      query_name = "e"
      display    = "bar"
      hidden     = false

      metric              = "aws.billing.estimated_charges_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["ServiceName","Currency",]
      }

    }

    query {
      query_name = "f"
      display    = "bar"
      hidden     = false

      metric              = "aws.billing.estimated_charges_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["Currency","ServiceName",]
      }

    }

    query {
      query_name = "g"
      display    = "bar"
      hidden     = false

      metric              = "aws.billing.estimated_charges_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["Currency","ServiceName",]
      }

    }

    query {
      query_name = "h"
      display    = "bar"
      hidden     = false

      metric              = "aws.billing.estimated_charges_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["ServiceName","Currency",]
      }

    }

    query {
      query_name = "i"
      display    = "bar"
      hidden     = false

      metric              = "aws.billing.estimated_charges_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["Currency","ServiceName",]
      }

    }

    query {
      query_name = "j"
      display    = "bar"
      hidden     = false

      metric              = "aws.billing.estimated_charges_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["Currency","ServiceName",]
      }

    }

    query {
      query_name = "k"
      display    = "bar"
      hidden     = false

      metric              = "aws.billing.estimated_charges_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["Currency","ServiceName",]
      }

    }

    query {
      query_name = "l"
      display    = "bar"
      hidden     = false

      metric              = "aws.billing.estimated_charges_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["Currency","ServiceName",]
      }

    }

    query {
      query_name = "m"
      display    = "bar"
      hidden     = false

      metric              = "aws.billing.estimated_charges_count"
      timeseries_operator = "delta"


      group_by {
        aggregation_method = "sum"
        keys               = ["ServiceName","Currency",]
      }

    }

  }

}
